img = rgb2gray(imread('wal1.jpg'));
img2 = img;

img3 = rgb2gray(imread('wal2.jpg'));
img4 = img3;

for x1=1:256
    hist_newimg(x1)=0;
end


for i=1:168
    for j=1:300
        hist_newimg(img(i,j)+1)= hist_newimg(img(i,j)+1)+1;
    end
end

count=0;

cdf(1) = 0;

for y1=1:256
    pdf(y1) = (hist_newimg(y1)/50400);
    
    if y1==1
        cdf(1)=pdf(1);
    else
        cdf(y1)= cdf(y1-1)+pdf(y1);
    end
    %disp(cdf(y1));
end

for z1=1:256
    new_int(z1) = round(cdf(z1)*255);
end

for i=1:168
    for j=1:300
        img2(i,j) = new_int(img(i,j)+1);
    end
end


for x2=1:256
    hist_spec(x2)=0;
end


for i=1:168
    for j=1:300
        hist_spec(img3(i,j)+1)= hist_spec(img3(i,j)+1)+1;
    end
end

count=0;

cdf(1) = 0;

for y2=1:256
    pdf(y2) = (hist_spec(y2)/50400);
    
    if y2==1
        cdf(1)=pdf(1);
    else
        cdf(y2)= cdf(y2-1)+pdf(y2);
    end
    %disp(cdf(y2));
end

for z2=1:256
    new_int(z2) = round(cdf(z2)*255);
end

for i=1:168
    for j=1:300
        img4(i,j) = new_int(img3(i,j)+1);
    end
end


figure(1);
imshow(img);

figure(2);
imshow(img2);

figure(3);
imshow(img3);

figure(4);
imshow(img4);