PImage deer;
PImage img;
PImage temp;
boolean brMap = false;
int preBright = -1;
int brightLevel = 80;

void setup() {
  size(1280, 720);
  deer = loadImage("deer.jpg");
  deer.resize(1280, 720);
  deer.loadPixels();
  img = createImage(deer.width, deer.height, RGB);
  img.loadPixels();

  change_levels();

  deer.updatePixels();
  img.updatePixels();
  pixelSort();
}

void change_levels() {
  for (int i = 0; i < deer.pixels.length - 1; i++) {
    if (brightness(deer.pixels[i]) > brightLevel) {
      img.pixels[i] = color(255, 255, 255);
    } else {
      img.pixels[i] = color(0, 0, 0);
    }
  }
  return;
}

boolean pixelSort() {
  int leftPixel = 0;
  int rightPixel = 0;
  int lastWhiteIndex = -1;
  temp = createImage(width, height, RGB);
  temp = deer.get();
  temp.loadPixels();

  for (int i = 0; i < img.pixels.length; i++) {
    if (img.pixels[i] == color(255, 255, 255)) {
      if (lastWhiteIndex != -1) {
        leftPixel = lastWhiteIndex;
        lastWhiteIndex = -1;
      } else {
        leftPixel = i;
      }
    } else if (img.pixels[i] == color(0, 0, 0)) {
      rightPixel = i - 1;
      if (rightPixel > leftPixel) {
        quickSort(temp.pixels, leftPixel, rightPixel);
      }
      lastWhiteIndex = i;
    }
  }
  return true;
}

void keyPressed() {
  switch(key){
    case 'a':
     if (brightLevel > 0)
        brightLevel -= 10;
     break; 
     
    case 'd':
        if (brightLevel < 240)
        brightLevel += 10;
        break;

    case 's':
        var fileName = "SortedImage"+ brightLevel + ".jpg";
        save(fileName);
        print("Image saved as " + fileName + "\n");
        break;

     case 'b':
        brMap = !brMap;
        break;
       
  }  
if(preBright != brightLevel){
  change_levels();
  print(brightLevel + " ");
  img.updatePixels();
  pixelSort();
  deer.updatePixels();
}
preBright = brightLevel;
 
}  
void quickSort(color arr[], int left, int right) {
  int i = left;
  int j = right;

  int temp;
  int pivot = (arr[(left + right) / 2]);

  while (i <= j) {
    while (arr[i] < pivot)
      i++;
    while (arr[j] > pivot)
      j--;

    if (i <= j) {
      temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      i++;
      j--;
    }
  }

  if (left < j)
    quickSort(arr, left, j);
  if (i < right)
    quickSort(arr, i, right);

  return;
}

void draw() {
  background(0);
  image(temp, 0, 0);
  if (brMap) {
    image(img, 0, 0);
  }
}
