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
