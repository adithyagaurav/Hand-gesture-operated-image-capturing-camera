clc
clear all
close all
vid=videoinput('winvideo',1);
set(vid,'ReturnedColorSpace','rgb')
preview(vid);
pause(5);
im = getsnapshot(vid);
delete(vid);
%subplot(2,2,1);
%imshow(im);
[m,n,t]=size(im);
bw=zeros(m,n);
for i=1:m
    for j=1:n
        if(im(i,j,1)>60 && im(i,j,2)<60 && im(i,j,3)<60)
              bw(i,j)=1;
%         elseif(im(i,j,1)<65 && im(i,j,2)<65 && im(i,j,3)>100)
%                 bw(i,j)=1;
        end
    end
end

se=strel('disk',9);
bw=imclose(bw,se);
bw=imfill(bw,'holes');
bw=bwareaopen(bw,2000);
%subplot(2,2,2);
%imshow(bw);
imwrite(im,'im.jpg');
imwrite(bw,'ibw.jpg');
%subplot(2,2,2);
%imshow(bw);
stats=regionprops(bw,'Area','Centroid');
 aa=stats(1).Area;
 ab=stats(2).Area;

 
 if(aa>2000 && ab>2000)
     vid1=videoinput('winvideo',1);
     set(vid1,'ReturnedColorSpace','rgb');
     preview(vid1);
%     pause(3);
     %[ws,fss]=wavread('snapshot.wav');
    % sound(ws,fss);
     im1=getsnapshot(vid1);
 %    subplot(2,2,3);
     cd('C:\Users\anilpal\Desktop');
     mkdir('sixth sense');
     cd('sixth sense');
     imwrite(im,'marker.jpg')
     imwrite(bw,'mask.jpg')
     imwrite(im1,'pic.jpg');
     cd('G:\Matlab work');
     imshow(im1);
     
     delete(vid1);
 end