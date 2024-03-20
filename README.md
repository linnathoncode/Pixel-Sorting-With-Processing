# Pixel Sorting based on Brightness Threshold

![Example](sample.gif)

This program implements pixel sorting based on brightness thresholding on an image using the Processing language. It provides functionalities to adjust the brightness threshold level interactively and toggle between displaying the original image and the processed image.

## Usage

- Press 'a' key to decrease the brightness threshold level by 10 units.
- Press 'd' key to increase the brightness threshold level by 10 units.
- Press 'b' key to toggle between displaying the brightness threshold and the processed image.
- Press 's' key to save the processed image.

## Instructions

1. **Install Processing**: If you haven't already, download and install Processing from [Processing's website](https://processing.org/download/).

2. **Prepare Image**: 
   - Ensure that the image file you want to process is saved in a compatible format (e.g., JPEG, PNG).
   - Rename the image file to "deer.jpg" or adjust the code accordingly if your file has a different name.
   - Optionally, resize the image to fit the canvas size by:
     - Using an image editing software like Photoshop or GIMP.
     - Modifying the resizing parameters in the code:
       ```java
       // To resize with the original image's aspect ratio, provide one parameter and leave the other as zero
       deer.resize(newWidth, 0); // Adjust newWidth as needed
       ```

3. **Run the Program**: Open the `.pde` file in Processing. Click the "Run" button to execute the program. The image will be loaded and displayed initially.

4. **Interact with the Program**: 
   - Use the 'a' and 'd' keys to adjust the brightness threshold level by decreasing or increasing it by 10 units, respectively.
   - Press the 'b' key to toggle between displaying the brightness threshold and the processed image.
   - Press the 's' key to save the processed image as a jpg file.

## Details

- Pixel sorting is primarily performed based on the brightness threshold level.
- Pixels with brightness greater than the threshold are set to white, while those below are set to black.
- The sorted pixels are displayed in the processed image, resulting in a visually sorted appearance.
- **Additional Sorting Options**: While the code is optimized for sorting based on brightness, you can experiment with sorting based on hue or saturation values by modifying the code accordingly. However, please note that the code is not optimized for these sorting methods, and performance may vary. You can explore and adjust the following sections of the code to experiment with different sorting criteria:
  ```java
  // Modify these sections to sort based on hue or saturation values
  if (brightness(deer.pixels[i]) > brightLevel) {
    // Sort pixels based on brightness
  }
