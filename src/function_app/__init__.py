import logging
import azure.functions as func
from PIL import Image
import io
import os

app = func.FunctionApp()

@app.blob_trigger(arg_name="myblob", 
                 path="original-images/{name}",
                 connection="AzureWebJobsStorage") 
@app.blob_output(arg_name="outputblob",
                path="thumbnails/{name}",
                connection="AzureWebJobsStorage")
def blob_trigger(myblob: func.InputStream, outputblob: func.Out[func.InputStream]) -> None:
    logging.info(f"Python blob trigger function processed blob \n"
                f"Name: {myblob.name}\n"
                f"Blob Size: {myblob.length} bytes")
    
    try:
        # Check if file is an image
        if not myblob.name.lower().endswith(('.png', '.jpg', '.jpeg', '.gif', '.bmp')):
            logging.info(f"Skipping non-image file: {myblob.name}")
            return

        # Open image from blob
        image = Image.open(myblob)
        
        # Convert to RGB if necessary (for PNG with transparency)
        if image.mode in ('RGBA', 'LA', 'P'):
            background = Image.new('RGB', image.size, (255, 255, 255))
            background.paste(image, mask=image.split()[-1] if image.mode == 'RGBA' else None)
            image = background
        elif image.mode != 'RGB':
            image = image.convert('RGB')
        
        # Resize image to 100x100 pixels using thumbnail method (maintains aspect ratio)
        image.thumbnail((100, 100), Image.Resampling.LANCZOS)
        
        # Create a new square image with white background
        squared_image = Image.new('RGB', (100, 100), (255, 255, 255))
        
        # Calculate position to center the thumbnail
        x = (100 - image.width) // 2
        y = (100 - image.height) // 2
        
        # Paste the resized image onto the squared background
        squared_image.paste(image, (x, y))
        
        # Save to bytes
        output = io.BytesIO()
        squared_image.save(output, format='JPEG', quality=85)
        output.seek(0)
        
        # Write to output blob
        outputblob.set(output.read())
        
        logging.info(f"Successfully resized image: {myblob.name} -> thumbnails/{myblob.name}")
        
    except Exception as e:
        logging.error(f"Error processing image {myblob.name}: {str(e)}")
        raise