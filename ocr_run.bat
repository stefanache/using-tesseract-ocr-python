@echo off
cls
rem tesseract images/example_01.png stdout
rem pause
rem python ocr.py --image images/example_01.png
rem pause

rem tesseract images/example_02.png stdout
rem pause

rem python ocr.py --image images/example_02.png --preprocess blur
rem pause

rem tesseract images/example_03.png stdout
rem pause

python ocr.py --image images/example_03.png
pause
