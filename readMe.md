Hi,
In this procedure intend to discuss about using tesseract-OCR from python.

The ref by me was this tutorial : https://www.pyimagesearch.com/2017/07/10/using-tesseract-ocr-python/

Remembr that in https://github.com/stefanache/install_Tesseract4_for_Python3.7 we discuss about 
   -installing Teseract-OCR and then
   -installing "it's "bidings" for python:
      -pytesseract(pip install pytesseract)
      -pillow(pip install pillow)

If you consult in https://en.wikipedia.org/wiki/Tesseract_(software) then you find this about tesseract:

"Tesseract is an optical character recognition engine for various operating systems.[3] It is free software, released under the Apache License, Version 2.0,[1][4][5] and development has been sponsored by Google since 2006.[6]

In 2006, Tesseract was considered one of the most accurate open-source OCR engines then available"

We can apply OCR-tesseract to the raw, unprocessed/brute image but exist some limitations.

   Limitations
   -----------
   
   - I seen that the background must to be clear(without noise) as preprocessing condition.
   
   If background have “salt and pepper” noise in the background then this noise must to be removed.
   
   The preprocessing openCV(cv2)-methods are two: thresh  (threshold: cv2.THRESH_BINARY  / cv2.THRESH_OTSU) or blur(medianBlur).
   
   The preprocesing is optional but if the image need denoise and we not aply the filtering(before at OCR-process) then can obtain errors.
   
   - If text is rotated then we must unrotated before OCR process
     (see at https://pyimagesearch.com/2017/02/20/text-skew-correction-opencv-python/).
     
   -We may obtain good or acceptable results with Tesseract for OCR, but the best accuracy will come from training custom character classifiers on specific sets of fonts that appear in actual real-world images.
