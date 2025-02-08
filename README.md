# Digital Image Processing (CENG462 Project)
The project I did at the end of the 6th semester for CENG462 (Digital Image Processing) course.

The primary objective was to analyze and implement different noise removal techniques for images affected by high-density salt and pepper noise.

## Research Paper

The project is based on the research paper:
"A New Switching-Based Median Filtering Scheme and Algorithm for Removal of High-Density Salt and Pepper Noise in Images" [Read the Paper](https://asp-eurasipjournals.springeropen.com/articles/10.1155/2010/690218)

## Problem Statement

Salt and pepper noise is a common issue in digital images, affecting their quality and subsequent processing tasks. Traditional median filters often struggle to restore images when the noise density is high. This project aims to evaluate different median-based filtering algorithms to improve image restoration.

## Methods & Setup

The following filtering methods were implemented and compared:

**Standard Median Filter (SMF)** - A basic method that replaces each pixel with the median of its neighbors.

**Adaptive Median Filter (AMF)** - Dynamically adjusts the filtering window size based on noise levels.

**Decision-Based Algorithm (DBA)** - Detects and replaces noisy pixels selectively to preserve image details.

**Recursive Median Filter (REMF)** - Combines median filtering with mean filtering for better restoration results.

### Experimental Setup

+ **Software:** MATLAB R2024a

+ **Hardware:** PC with 2.60 GHz CPU, 1.76 GHz GPU, 16 GB RAM

+ **Test Images:** Various images with 40% noise density

## Results & Conclusion

The Recursive Median Filter (REMF) and Decision-Based Algorithm (DBA) produced the best results.

SMF was fast but less effective for high noise levels.

AMF dynamically handled noise but required more computation.

DBA and REMF provided superior image quality, with REMF showing the best performance in most cases.

### Sample Input/Output Images

- Building Image Input (Width: 597 pixels, Height: 595 pixels, Bit depth: 8, Size: 110KB):
  
  ![input](https://github.com/user-attachments/assets/de207723-9cd8-41d3-94b2-e63722ba5f79)
  
- Noisy Image with 40% noise density:
  
  ![noisy](https://github.com/user-attachments/assets/4ae2c6e1-247e-4f4d-8d15-ca9c6ba50169)

- Simple Median Filter Output:

  ![output_SMF](https://github.com/user-attachments/assets/d2377f19-b397-4836-a4d7-df4d8dbe631c)

- Adaptive Median Filter Output:

  ![output_AMF](https://github.com/user-attachments/assets/cff1c99c-5bbc-4e85-bf14-56fccecb8850)

- Decision Based Algorithm Output:

  ![output_DBA](https://github.com/user-attachments/assets/cf72fd25-497a-4bd3-836b-1da9d1e94830)

- Recursive Median Filter Output:

  ![output_REMF](https://github.com/user-attachments/assets/26dda4b6-ac0c-4084-ade4-45dbb436eb6b)
