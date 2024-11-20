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
