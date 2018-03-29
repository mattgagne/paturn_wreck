load feat.mat

figure(1);
image1 = readim('cloth.im');
subplot(3, 4, 1);
imagesc(image1);
colormap(gray);
title('Cloth');

image2 = readim('cork.im');
subplot(3, 4, 2);
imagesc(image2);
colormap(gray);
title('Cork');

image3 = readim('cotton.im');
subplot(3, 4, 3);
imagesc(image3);
colormap(gray);
title('Cotton');

image4 = readim('face.im');
subplot(3, 4, 4);
imagesc(image4);
colormap(gray);
title('Face');

image5 = readim('grass.im');
subplot(3, 4, 5);
imagesc(image5);
colormap(gray);
title('Grass');

image6 = readim('paper.im');
subplot(3, 4, 6);
imagesc(image6);
colormap(gray);
title('Paper');

image7 = readim('pigskin.im');
subplot(3, 4, 7);
imagesc(image7);
colormap(gray);
title('Pigskin');

image8 = readim('raiffa.im');
subplot(3, 4, 8);
imagesc(image8);
colormap(gray);
title('Raiffa');

image9 = readim('stone.im');
subplot(3, 4, 9);
imagesc(image9);
colormap(gray);
title('Stone');

image10 = readim('straw.im');
subplot(3, 4, 10);
imagesc(image10);
colormap(gray);
title('Straw');

image11 = readim('wood.im');
subplot(3, 4, 11);
imagesc(image11);
colormap(gray);
title('Wood');

image12 = readim('wool.im');
subplot(3, 4, 12);
imagesc(image12);
colormap(gray);
title('Wool');

figure(2);
aplot(f2);