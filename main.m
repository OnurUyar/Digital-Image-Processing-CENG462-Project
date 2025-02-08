function output = smf(img) % --- Simple Median Filter
    output = medfilt2(img);
end

function output = amf(img, smax) % --- Adaptive Median Filter
    [m, n] = size(img);
    output = img;
    for i = 1:m
        for j = 1:n
            window_size = 3;
            while window_size <= smax
                half_window = floor(window_size / 2); % Defining the window boundaries.
                rmin = max(i-half_window, 1);
                rmax = min(i+half_window, m);
                cmin = max(j-half_window, 1);
                cmax = min(j+half_window, n);
                
                window = img(rmin:rmax, cmin:cmax); % Implementing the window.
                Zmin = min(window(:));
                Zmax = max(window(:));
                Zmed = median(window(:));
                A1 = Zmed - Zmin;
                A2 = Zmed - Zmax;
                
                if A1 > 0 && A2 < 0
                    B1 = img(i,j) - Zmin;
                    B2 = img(i,j) - Zmax;
                    if B1 > 0 && B2 < 0
                        output(i,j) = img(i,j);
                    else
                        output(i,j) = Zmed;
                    end
                    break;
                else
                    window_size = window_size + 2;
                end
            end
            if window_size > smax
                output(i,j) = Zmed;
            end
        end
    end
end

function output = dba(img) % --- Decision Based Algorithm
    [m, n] = size(img);
    output = img;

    for i = 2:m-1
        for j = 2:n-1
            if img(i,j) == 0 || img(i,j) == 255
                window = img(i-1:i+1, j-1:j+1);
                window = window(:);
                window(window == 0 | window == 255) = [];
                if isempty(window)
                    output(i,j) = median(img(:));
                else
                    output(i,j) = median(window);
                end
            end
        end
    end
end

function output = remf(img) % --- Recursive Median Filter
    [m, n] = size(img);
    output = img;

    for i = 2:m-1
        for j = 2:n-1
            if img(i,j) == 0 || img(i,j) == 255
                window = img(i-1:i+1, j-1:j+1);
                Zmed = median(window(:));
                if Zmed > 0 && Zmed < 255
                    output(i,j) = Zmed;
                else
                    output(i,j) = mean(window(window > 0 & window < 255));
                end
            end
        end
    end
end

function histogram(img, filename) % Creating histograms.
    figure;
    imhist(img);
    title(['Histogram of ', filename]);
    saveas(gcf, filename);
    close;
end


%-----------------------------------------------%


img = imread('input.png'); % Reading input image.

% Editing image to the black-white, if input image is not black-white.
if size(img, 3) == 3
    edited_image = rgb2gray(img);
else
    edited_image = img;
end

noisy_img = imnoise(edited_image, 'salt & pepper', 0.40);
imshow(noisy_img);              % Noising Image with 40% density.
imwrite(noisy_img, 'noisy.png');
title('Noisy Image');


% Applying filters and saving outputs and histograms for each function.
smf_result = smf(noisy_img);
imwrite(smf_result, 'output_SMF.png');
imshow(smf_result);
title('Simple Median Filter');
histogram(smf_result, 'SMF.png');

amf_result = amf(noisy_img, 7);
imwrite(amf_result, 'output_AMF.png');
imshow(amf_result);
title('Adaptive Median Filter');
histogram(amf_result, 'AMF.png');

dba_result = dba(noisy_img);
imwrite(dba_result, 'output_DBA.png');
imshow(dba_result);
title('Decision-Based Algorithm');
histogram(dba_result, 'DBA.png');

remf_result = remf(noisy_img);
imwrite(remf_result, 'output_REMF.png');
imshow(remf_result);
title('Recursive Median Filter');
histogram(remf_result, 'REMF.png');
