% Load the image
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
