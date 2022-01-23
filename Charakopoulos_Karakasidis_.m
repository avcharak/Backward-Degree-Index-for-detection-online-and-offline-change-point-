%% Increase and Decrease Detection
%This algoritmh detect the increase and decrease change point 
% INPUTS
%       R:  time series 
%       ni:  point for average in case of increase
%       nd:  point for average in case of decrease

% Developed by Avraam Charakopoulos, PhD, and Theodoros Karakasidis Prof., June 21 .

% Increase case
ni=16;                      
SPtest=R;            
DSPtest=diff(SPtest);              
a=abs(DSPtest);                                              
[Net_test] = Visibility (a,2); Net_test=double(Net_test);  % network construction
Net_Degree_test=degrees_unda(Net_test);                     % backward network degree
Net_Degree_test=Net_Degree_test';
MA2test=movmean(Net_Degree_test,ni);             %moving mean of backward degree time series
MStd2test=movstd(Net_Degree_test,ni);            %moving std of backward degree time series
MA2MStd2test=MA2test+MStd2test;
Adok=(MA2MStd2test>(mean(MA2MStd2test)+2*std(MA2MStd2test)));
maximum = max(max(Adok));
[x,y]=find(Adok==maximum);
t=1:length(SPtest)';

% Decrease case  
    
nd=23;                             
SPtest1=R;            
DSPtest1=diff(SPtest1);                              
a=DSPtest1;
a(a>0) = 0;
[Net_test1] = Visibility (a,2); Net_test1=double(Net_test1);  % Ìåôáó÷çìáôéóìüò óå äßêôõï
Net_Degree_test1=degrees_unda(Net_test1);   % õðïëïãßæù ôïí âáèìü äéêôýïõ (back)
Net_Degree_test1=Net_Degree_test1';
MA2test1=movmean(Net_Degree_test1,nd);%plot(MA2test);hold on; plot(Net_Degree_test)   %êéíïýìåíïò ìÝóïò üñïò ÷ñïíïóåéñÜ âáèìïý
MStd2test1=movstd(Net_Degree_test1,nd);%plot(MStd2test);%êéíïýìåíç äéáêýìáíóç ÷ñïíïóåéñÜ âáèìïý
MA2MStd2test1=MA2test1+MStd2test1;%plot(MA2MStd2test); %õðïëïãéæù ôçí ðïóüôçôá
Adok1=(MA2MStd2test1>(mean(MA2MStd2test1)+2*std(MA2MStd2test1)));
maximum1 = max(max(Adok1))
 [x1,y1]=find(Adok1==maximum1)
 t1=1:length(SPtest1)';
   
    figure ()    
    tt=1:length(Adok)';
    plot(tt,Adok);   
    hold on
    plot(tt(x), Adok(x), 'ro')
    grid on
    hold on
    tt1=1:length(Adok1)';
    plot(tt1,Adok1); 
    grid on
    hold on
    plot(tt1(x1), Adok1(x1), 'gs')
    axis([0 200 0 1.5])
    title('Backward Degree Index (BDI)')
    xlabel('t')
    ylabel('BDI')
    legend('BDI_ (increase index) ','Data meets the BDI criterion','BDI_ (decrease index)','Data meets the BDI criterion')  
  
    figure ()
    plot(t,SPtest);
    hold on
    plot(t(x), SPtest(x), 'ro') 
    hold on
    plot(t(x1), SPtest1(x1), 'gs') 
    grid on
    title('Backward Degree Detection Method')
    xlabel('t')
    ylabel('y(t)')
    legend('Time series', 'Detected data increase','Detected data decrease')
    
 %% Animation Increase and Decrease Detection

h = animatedline('Color','b');  
t=1:length(SPtest)';   
y = SPtest(t);
[A,map] = rgb2ind(frame2im(getframe),256);
imwrite(A,map,'Synthetic_up_down.gif','LoopCount',65535,'DelayTime',0.5);

for k = 1:length(t)
    
    %set figure properties from start
        axis([0 200 -0.5 5])
        grid on, box on
        xlabel('t')
        ylabel('y(t)')
        addpoints(h,t(k),y(k));
        drawnow
        pause(0.05)       
        hold on
    
   if(mod(k,1)==0)  
        [A,map] = rgb2ind(frame2im(getframe),256);
        imwrite(A,map,'Synthetic_up_down.gif','WriteMode','append','DelayTime',0.1);
        
   end
    
   hold on
    for j = x(1,:):x(end,:) 
        if j==k plot(t(j),SPtest(j),'r','Marker','o','MarkerSize',8)
        end
    end

   for j = x1(1,:):x1(end,:) 
        if j==k plot(t1(j),SPtest1(j),'g','Marker','s','MarkerSize',8) 
        end
   end
hh = zeros(3, 1);
hh(1) = plot(NaN,NaN,'-b');
hh(2) = plot(NaN,NaN,'-or');
hh(3) = plot(NaN,NaN,'-sg');
legend(hh, 'Time series','Detected data increase','Detected data decrease');
xlabel('t')
ylabel('y(t)')
end


%% Decrease and Increase Detection
 
% INPUTS
%       RN:   time series 
%       nid:  point for average in case of increase
%       ndi:  point for average in case of decrease

ndi=29;                              
SPtest=RN;            
DSPtest=diff(SPtest);       
a=abs(DSPtest);                                               
[Net_test] = Visibility (a,2); Net_test=double(Net_test);  
Net_Degree_test=degrees_unda(Net_test);   
Net_Degree_test=Net_Degree_test';
MA2test=movmean(Net_Degree_test,ndi);
MStd2test=movstd(Net_Degree_test,ndi);
MA2MStd2test=MA2test+MStd2test;
Adok=(MA2MStd2test>(mean(MA2MStd2test)+2*std(MA2MStd2test)));
maximum = max(max(Adok));
    [x,y]=find(Adok==maximum);
    t=1:length(SPtest)';  
nid=16;                         
SPtest1=RN;              
DSPtest1=diff(SPtest1);     
aa=DSPtest1;
aa(aa>0) = 0;
[Net_test1] = Visibility (aa,2); Net_test1=double(Net_test1);  
Net_Degree_test1=degrees_unda(Net_test1);   
Net_Degree_test1=Net_Degree_test1';
MA2test1=movmean(Net_Degree_test1,nid);
MStd2test1=movstd(Net_Degree_test1,nid);
MA2MStd2test1=MA2test1+MStd2test1;
Adok1=(MA2MStd2test1>(mean(MA2MStd2test1)+2*std(MA2MStd2test1)));
maximum1 = max(max(Adok1))
 [x1,y1]=find(Adok1==maximum1)
 t1=1:length(SPtest1)';
    
    figure ()    
    tt=1:length(Adok)';
    plot(tt,Adok);   
    hold on
    plot(tt(x), Adok(x), 'ro')
    grid on
    hold on
    tt1=1:length(Adok1)';
    plot(tt1,Adok1); 
    grid on
    hold on
    plot(tt1(x1), Adok1(x1), 'gs')
    axis([0 200 0 1.5])
    title('Backward Degree Index (BDI)')
    xlabel('t')
    ylabel('BDI criterion')
    legend('BDI_ (increase index) ','Data meets the BDI criterion','BDI_ (decrease index)','Data meets the BDI criterion')  

     
    figure ()
    plot(t,SPtest);
    hold on
    plot(t(x), SPtest(x), 'ro') 
    hold on
    plot(t(x1), SPtest1(x1), 'gs') 
    grid on
    title('Backward Degree Detection Method')
    xlabel('t')
    ylabel('y(t)')
    legend({'Time series', 'Detected data increase','Detected data decrease'},'Location','southwest')
    
    
%% Animation Decrease and Increase Detection

h = animatedline('Color','b');  

t=1:length(SPtest)';  
y = SPtest(t);

[A,map] = rgb2ind(frame2im(getframe),256);
imwrite(A,map,'Synthetic_down_up.gif','LoopCount',65535,'DelayTime',0.5);



for k = 1:length(t)
    
        axis([0 200 -4 0])
        grid on, box on
        xlabel('t')
        ylabel('y(t)')
        addpoints(h,t(k),y(k));
        drawnow
        pause(0.05)        
        hold on

   if(mod(k,1)==0)  %1 allazo
        [A,map] = rgb2ind(frame2im(getframe),256);
        imwrite(A,map,'Synthetic_down_up.gif','WriteMode','append','DelayTime',0.1);   
   end
    
   hold on
    
    for j = x(1,:):x(end,:) 
        if j==k plot(t(j),SPtest(j),'r','Marker','o','MarkerSize',8)   
        end
    end
     
   for j = x1(1,:):x1(end,:) 
        if j==k plot(t1(j),SPtest1(j),'g','Marker','s','MarkerSize',8)        
        end    
   end
hh = zeros(3, 1);
hh(1) = plot(NaN,NaN,'-b');
hh(2) = plot(NaN,NaN,'-or');
hh(3) = plot(NaN,NaN,'-sg');
legend(hh, 'Time series','Detected data increase','Detected data decrease','Location','southwest');
xlabel('t')
ylabel('y(t)')
end
