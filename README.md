# Optimizing S-box Selection in Image Encryption
dataset;
Image	Entropy	Contrast	correlation	Energy	Homogeneity
AES	7.9325	7.2240	0.0815	0.0211	0.4701
APA	7.8183	8.9114	0.1258	0.0193	0.4665
Lui	7.9325	7.2240	0.1311	0.0211	0.4701
Prime	7.8811	6.9646	0.2769	0.0198	0.4728
S_8 	7.9447	8.1274	0.0734	0.0190	0.4552
Gray	7.9299	7.7961	0.1014	0.0198	0.4567
Xyi 	7.9127	7.8942	0.1413	0.0188	0.4605
Skipjack 	7.8939	5.4255	0.3123	0.0232	0.5004
Matlab Codes for different types S-box Transformations

1.	AES S-box Transformation

% Load the image
original_image = imread('hamdan.jpg'); % Replace with your image file
% Resize for faster processing, if needed
original_image = imresize(original_image, [256, 256]);
% Convert the image to RGB if it is not already
if size(original_image, 3) == 1
    original_image = repmat(original_image, [1 1 3]);
end
% Define a random 32x32 S-box for demonstration (values from 0 to 255)
sbox = uint8(randi([0, 255], 32, 32)); % Random 32x32 S-box
% Initialize the encrypted image matrix
ciphered_image = zeros(size(original_image), 'uint8');
% Perform S-box transformation on each pixel channel
for channel = 1:3
    for i = 1:size(original_image, 1)
        for j = 1:size(original_image, 2)
            % Extract pixel value
            pixel_value = original_image(i, j, channel);
            % Find the row and column in the S-box for a 32x32 S-box
            row = bitshift(pixel_value, -3) + 1;  % High 5 bits (divide by 8) as row index
            col = bitand(pixel_value, 31) + 1;    % Low 5 bits as column index (0-31 range)
            % Apply S-box transformation
            ciphered_image(i, j, channel) = sbox(row, col);
        end
    end
end
% Display only the transformed image
imshow(ciphered_image);
title('AES S-box Transformed Image');
 
2.	APA S-box Transformation

% Load the image
original_image = imread('hamdan.jpg'); % Replace with your image file
% Resize for faster processing, if needed
original_image = imresize(original_image, [256, 256]);
% Convert the image to RGB if it is not already
if size(original_image, 3) == 1
    original_image = repmat(original_image, [1 1 3]);
end
% Define a random 32x32 S-box for demonstration (values from 0 to 255)
sbox = uint8(randi([0, 255], 32, 32)); % Random 32x32 S-box
% Initialize the encrypted image matrix
ciphered_image = zeros(size(original_image), 'uint8');
% Perform S-box transformation on each pixel channel
for channel = 1:3
    for i = 1:size(original_image, 1)
        for j = 1:size(original_image, 2)
            % Extract pixel value
            pixel_value = original_image(i, j, channel);
            % Find the row and column in the S-box for a 32x32 S-box
            row = bitshift(pixel_value, -3) + 1;  % High 5 bits (divide by 8) as row index
            col = bitand(pixel_value, 31) + 1;    % Low 5 bits as column index (0-31 range)
            % Apply S-box transformation
            ciphered_image(i, j, channel) = sbox(row, col);
        end
    end
end
% Display only the transformed image
imshow(ciphered_image);
title('APA S-box Transformed Image');
 
3.	Gray S-box Transformation

% Load the image
original_image = imread('hamdan.jpg'); % Replace with your image file
% Resize for faster processing, if needed
original_image = imresize(original_image, [256, 256]);
% Convert the image to RGB if it is not already
if size(original_image, 3) == 1
    original_image = repmat(original_image, [1, 1, 3]);
end
% Define a random 32x32 S-box for demonstration (values from 0 to 255)
sbox = uint8(randi([0, 255], 32, 32)); % Random 32x32 S-box
% Initialize the encrypted image matrix
ciphered_image = zeros(size(original_image), 'uint8');
% Gray code lookup table for 5-bit values
gray_code = uint8([0 1 3 2 6 7 5 4 12 13 15 14 10 11 9 8 ...
                   24 25 27 26 30 31 29 28 20 21 23 22 18 19 17 16]);
% Perform S-box transformation on each pixel channel using Gray coding
for channel = 1:3
    for i = 1:size(original_image, 1)
        for j = 1:size(original_image, 2)
            % Extract pixel value
            pixel_value = original_image(i, j, channel);
            % Convert pixel value to Gray-coded row and column indices for S-box
            row = gray_code(bitshift(pixel_value, -3) + 1) + 1; % Gray-coded high 5 bits
            col = gray_code(bitand(pixel_value, 31) + 1) + 1;   % Gray-coded low 5 bits
            % Apply S-box transformation
            ciphered_image(i, j, channel) = sbox(row, col);
        end
    end
end
% Display only the transformed image
imshow(ciphered_image);
title('Gray S-box Transformed Image');
 
4.	Lui S-box Transformation

% Load the image
original_image = imread('hamdan.jpg'); % Replace with your image file
% Resize for faster processing, if needed
original_image = imresize(original_image, [256, 256]);
% Convert the image to RGB if it is grayscale
if size(original_image, 3) == 1
    original_image = repmat(original_image, [1, 1, 3]);
end
% Define a random 32x32 S-box for demonstration (values from 0 to 255)
sbox = uint8(randi([0, 255], 32, 32)); % Random 32x32 S-box
% Initialize the encrypted image matrix
ciphered_image = zeros(size(original_image), 'uint8');
% Perform S-box transformation on each pixel in each channel
for channel = 1:3
    for i = 1:size(original_image, 1)
        for j = 1:size(original_image, 2)
            % Extract pixel value
            pixel_value = original_image(i, j, channel);
            % Calculate the row and column indices for the 32x32 S-box
            row = bitshift(pixel_value, -3) + 1;  % Use high 5 bits (divide by 8) for row index
            col = bitand(pixel_value, 31) + 1;    % Use low 5 bits for column index (0-31 range)         
            % Apply the S-box transformation
            ciphered_image(i, j, channel) = sbox(row, col);
        end
    end
end
% Display only the transformed (ciphered) image
imshow(ciphered_image);
title('Lui S-box Transformed Image');
 
5.	Prime S-box Transformation
original_image = imread('hamdan.jpg'); % Replace with your image file
% Resize for faster processing, if needed
original_image = imresize(original_image, [256, 256]);
% Convert the image to RGB if it is not already
if size(original_image, 3) == 1
    original_image = repmat(original_image, [1, 1, 3]);
end
% Define a prime-based S-box transformation table for a 32x32 S-box
% Generate prime values to fill the S-box
prime_list = primes(255); % Get all primes less than 256
sbox = zeros(32, 32, 'uint8'); % Initialize a 32x32 S-box matrix
% Fill the S-box using prime values in a sequential manner
% Wrap around if necessary to keep S-box 32x32
prime_index = 1;
for row = 1:32
    for col = 1:32
        sbox(row, col) = prime_list(mod(prime_index - 1, numel(prime_list)) + 1);
        prime_index = prime_index + 1;
    end
end
% Initialize the encrypted image matrix
ciphered_image = zeros(size(original_image), 'uint8');
% Perform S-box transformation on each pixel channel
for channel = 1:3
    for i = 1:size(original_image, 1)
        for j = 1:size(original_image, 2)
            % Extract pixel value
            pixel_value = original_image(i, j, channel);
            % Find the row and column in the S-box for a 32x32 S-box
            row = bitshift(pixel_value, -3) + 1;  % High 5 bits (divide by 8) as row index
            col = bitand(pixel_value, 31) + 1;    % Low 5 bits as column index (0-31 range)
            % Apply S-box transformation
            ciphered_image(i, j, channel) = sbox(row, col);
        end
    end
end
% Display the transformed (ciphered) image
imshow(ciphered_image);
title('Prime S-box Transformed Image');
 
6.	S8 S-box Transformation

% Load the image
original_image = imread('hamdan.jpg'); % Replace with your image file
% Resize for faster processing, if needed
original_image = imresize(original_image, [256, 256]);
% Convert the image to RGB if it is not already
if size(original_image, 3) == 1
    original_image = repmat(original_image, [1, 1, 3]);
end
% Define a random 32x32 S-box for demonstration (values from 0 to 255)
sbox = uint8(randi([0, 255], 32, 32)); % Random 32x32 S-box
% Initialize the encrypted image matrix
ciphered_image = zeros(size(original_image), 'uint8');
% Perform S-box transformation on each pixel channel
for channel = 1:3
    for i = 1:size(original_image, 1)
        for j = 1:size(original_image, 2)
            % Extract pixel value
            pixel_value = original_image(i, j, channel);
            % Find the row and column in the S-box for a 32x32 S-box
            row = bitshift(pixel_value, -3) + 1;  % High 5 bits (divide by 8) as row index
            col = bitand(pixel_value, 31) + 1;    % Low 5 bits as column index (0-31 range)
            % Apply S-box transformation
            ciphered_image(i, j, channel) = sbox(row, col);
        end
    end
end
% Display the transformed image
imshow(ciphered_image);
title('S8 S-box Transformed Image');
 
7.	Xyi S-box Transformation

% Load the image
original_image = imread('hamdan.jpg'); % Replace 'hamdan.jpg' with your image file
% Resize for faster processing, if needed
original_image = imresize(original_image, [256, 256]);
% Convert the image to RGB if it is grayscale
if size(original_image, 3) == 1
    original_image = repmat(original_image, [1 1 3]);
end
% Define a random 32x32 S-box for demonstration (values from 0 to 255)
sbox = uint8(randi([0, 255], 32, 32)); % Random 32x32 S-box
% Initialize the encrypted image matrix
ciphered_image = zeros(size(original_image), 'uint8');
% Perform S-box transformation on each pixel channel
for channel = 1:3
    for i = 1:size(original_image, 1)
        for j = 1:size(original_image, 2)
            % Extract pixel value
            pixel_value = original_image(i, j, channel);
            % Determine the row and column in the S-box for a 32x32 S-box
            row = bitshift(pixel_value, -3) + 1;  % Use the upper 5 bits (divide by 8) for row
            col = bitand(pixel_value, 31) + 1;    % Use the lower 5 bits for column
            % Apply S-box transformation
            ciphered_image(i, j, channel) = sbox(row, col);
        end
    end
end
% Display the transformed image
imshow(ciphered_image);
title('Xyi S-box Transformed Image');
 
8.	Skipjack S-box Transformation

% Load the image
original_image = imread('hamdan.jpg'); % Replace with your image file
% Resize for faster processing, if needed
original_image = imresize(original_image, [256, 256]);
% Convert the image to RGB if it is not already
if size(original_image, 3) == 1
    original_image = repmat(original_image, [1 1 3]);
end
% Define a random 32x32 S-box for demonstration (values from 0 to 255)
sbox = uint8(randi([0, 255], 32, 32)); % Random 32x32 S-box
% Initialize the encrypted image matrix
ciphered_image = zeros(size(original_image), 'uint8');
% Perform S-box transformation on each pixel channel
for channel = 1:3
    for i = 1:size(original_image, 1)
        for j = 1:size(original_image, 2)
            % Extract pixel value
            pixel_value = original_image(i, j, channel);
            % Calculate the row and column in the S-box for a 32x32 S-box
            row = bitshift(pixel_value, -3) + 1;  % High 5 bits (divide by 8) as row index
            col = bitand(pixel_value, 31) + 1;    % Low 5 bits as column index (0-31 range)
            % Apply S-box transformation
            ciphered_image(i, j, channel) = sbox(row, col);
        end
    end
end
% Display only the transformed image
imshow(ciphered_image);
title('Skipjack S-box Transformed Image'); 
