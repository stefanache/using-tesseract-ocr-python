Hi,

Optical Character Recognition (OCR)

In this procedure intend to discuss about using tesseract-OCR with Python and OpenCV(cv2).

The ref by me was this tutorial : https://www.pyimagesearch.com/2017/07/10/using-tesseract-ocr-python/

Remembr that in https://github.com/stefanache/install_Tesseract4_for_Python3.7 we discuss about 

   - installing Teseract-OCR and then
   - installing "it's "bidings" for python:
      - pytesseract(pip install pytesseract)
      - pillow(pip install pillow);  Pillow is a more Python-friendly version of PIL.

If you consult in https://en.wikipedia.org/wiki/Tesseract_(software) then you find this about tesseract:

"Tesseract is an optical character recognition engine for various operating systems.[3] It is free software, released under the Apache License, Version 2.0,[1][4][5] and development has been sponsored by Google since 2006.[6]

In 2006, Tesseract was considered one of the most accurate open-source OCR engines then available"

OCR-Tesseract is one algoritm and one engine(standalone system).

Pytesseract is one python biding with OCR-Tesseract wich permit to use this algorithm inner python code.

We can apply OCR-tesseract to the raw, unprocessed/brute image but exist some limitations.

   Limitations
   -----------
   
   - I seen that the background must to be clear(without noise) as preprocessing condition.
   
   If background have “salt and pepper” noise in the background then this noise must to be removed.
   
   The preprocessing openCV(cv2)-methods are two: 
   
         - thresh  (threshold: cv2.THRESH_BINARY  / cv2.THRESH_OTSU) 
         - blur(medianBlur).
   
   The preprocesing is optional but if the image need denoise and we not aply the filtering(before at OCR-process) then can obtain errors.
   
   - If text is rotated then we must unrotated before OCR process
     (see at https://pyimagesearch.com/2017/02/20/text-skew-correction-opencv-python/).
     
   - We may obtain good or acceptable results with Tesseract for OCR, but the best accuracy will come from training custom character classifiers on specific sets of fonts that appear in actual real-world images.
   
   - Deep learning and Convolutional Neural Networks (CNNs) are certainly enabling us to obtain higher accuracy, but we are still a long way from seeing “near perfect” OCR systems.
   
   The underlying OCR engine itself utilizes a Long Short-Term Memory (LSTM) network, a kind of Recurrent Neural Network (RNN).
   
   The new v4 release of Tesseract use LSTMs

 The EAST text detector permit to detect the location(ROIs - Regions Of Interest) of text in an image and then OCR it.
 
 So EAST( Efficient and Accurate Scene Text ) improve the OCR.
 
 OpenCV’s EAST detector to automatically detect text in both images and video streams.
 
 OpenCV’s EAST text detector is a deep learning model, based on a novel architecture and training pattern. 
 
 It is capable of 
 
      (1) running at near real-time at 13 FPS on 720p images and 
      (2) obtains state-of-the-art text detection accuracy.
 
 See EAST in this tutorial at https://www.pyimagesearch.com/2018/09/17/opencv-ocr-and-text-recognition-with-tesseract/
 
 On short we can build one OCR pipeline using OpenCV+Tesseract:
 
 Input image -> OpenCV's EAST(Text Detector) -> Extract Text ROIs -> Tesseract v.4 OCR with LSTM(text recognizer) -> OpenCV+Tesseract OCR Results

Another way is Google Vision API.
See at 

Conclusion
-----------

   If neither Tesseract nor the Google Vision API obtain reasonable accuracy, you might want to reassess your dataset and decide if it’s worth it to train your own custom character classifier — this is especially true if your dataset is noisy and/or contains very specific fonts you wish to detect and recognize. 
   Examples of specific fonts include the digits on a credit card, the account and routing numbers found at the bottom of checks, or stylized text used in graphic design.
