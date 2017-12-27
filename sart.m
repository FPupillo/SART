%Sustained Attension for Response Task
%Create by Francesco Pupillo
%University of Aberdeen, School of Psychology
%francesco.pupillo@abdn.ac.uk
%18-Sep-2017


function [experimenter, SubjNr, SartScore] = sart()
experimenter=input('Please enter your experiment code','s');
SubjNr=input('Please enter the subject number','s');
numbers2=[repmat(1:9,1,25)]; %create a vector of numbers from one to 9 repeated 25 timesk
numbers1=[repmat(1:9,1,2)]; %create a vectore of numbers from 1 to 9, repeated 2 times (18 numbers). plus one number at the end (19(
numbersTorder1=numbers1(randperm(length(numbers1))); %randomised numbers for the practice
numbersTorder2=numbers2(randperm(length(numbers2)));%randomised numbers for the task
textsize=[48,72,94, 100, 120]; %size of the numbers presented in the screen


try 
   
    %comp=Screen('Computer') ; %carachteristics of the computer
    %screens=Screen('Screens'); %display the screens
    rect=Screen('Rect', 1) ;% returns an array with the top left corner and the bottom right corner coordinates of the screen
    [MyScreen, rect] = Screen('OpenWindow', 0, [0, 0, 0]);
    %[MyScreen, rect] = Screen('OpenWindow', 0, [0, 0, 0], rect/2);
    %get the flip interval
    slack=Screen('GetFlipInterval', MyScreen)/2; %the slack is the time the screen takes to refresh
    %oval_size=[rect(3)/2-100,rect(4)/2-100,rect(3)/2+100,rect(4)/2+100];
    %Screen('FrameOval', MyScreen , [255,255,255], CenterRect([0,0,100,100],rect)); %create the frame
    %Screen('FillOval ', MyScreen , [255,0,0], oval_size);   %create the white or black oval
    %Draw the Fixation
    oval_size=[0,0,100,100]; %size of the oval
    frame=CenterRect(oval_size,rect); %put the oval in the center of the screen
    rect2=[0,0,rect(3), rect(4)/1.30]; %coordinates of the oval
    a=34; %the angle of the cross  
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a, rect(4)/2.6-a,rect(3)/2+a,rect(4)/2.6+a); %line
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a,rect(4)/2.6+a, rect(3)/2+a,rect(4)/2.6-a); %line
    Screen('FrameOval', MyScreen , [255,255,255], CenterRect([0,0,100,100],rect2)); %oval
     if rect(3)/rect(4)==1.25  %get different coordinate of the text if the screen is 3/4
    DrawFormattedText(MyScreen,'In this task you will see\n\na series of numbers appear on the screen,\n\nseparated by the sign:','center', rect(3)/6   , [255 255 255]);
    DrawFormattedText(MyScreen,'Your job is to push the SPACE BAR\n\nwhen you see any number EXCEPT for the number 3.','center', rect(3)/2, [255 255 255]);
    DrawFormattedText(MyScreen,'Please try to work as fast and as quickly as possible.','center', rect(3)/1.5, [255 255 255]);
    DrawFormattedText(MyScreen,'Press the SPACE BAR to continue','center', rect(3)/1.2 , [255 255 255]);
    Screen('Flip', MyScreen);
    HideCursor()
    KbWait;
    WaitSecs(1);
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a, rect(4)/2.6-a,rect(3)/2+a,rect(4)/2.6+a);
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a,rect(4)/2.6+a, rect(3)/2+a,rect(4)/2.6-a);
    Screen('FrameOval', MyScreen , [255,255,255], CenterRect([0,0,100,100],rect2));
    DrawFormattedText(MyScreen,'The numbers will appear quickly.\n\nDo not get overwhelmed.\n\nThis sign will come up quickly after each number:','center', rect(3)/6, [255 255 255]);
    DrawFormattedText(MyScreen,'You may still press the SPACE BAR during this time\n\n\n\nDo not press anything for the number 3.','center', rect(3)/2, [255 255 255]);
    DrawFormattedText(MyScreen,'Press the SPACE BAR to start the practice trial','center', rect(3)/1.5, [255 255 255]);
    Screen('Flip', MyScreen);
    KbWait;
    WaitSecs(1);
     else 
    DrawFormattedText(MyScreen,'In this task you will see\n\na series of numbers appear on the screen,\n\nsepareted by the sign:','center', rect(3)/12, [255 255 255]);
    DrawFormattedText(MyScreen,'Your job is to push the SPACE BAR\n\nwhen you see any nuber EXCEPT for the number 3.','center', rect(3)/3.5, [255 255 255]);
    DrawFormattedText(MyScreen,'Please try to work as fast and as quickly as possible.','center', rect(3)/2.5, [255 255 255]);
    DrawFormattedText(MyScreen,'Press the SPACE BAR to continue','center', rect(3)/2, [255 255 255]);
    Screen('Flip', MyScreen); %Flip the screen
    KbWait; %wait for a key press
    WaitSecs(1); %wait 1 sec before changing the screen
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a, rect(4)/2.6-a,rect(3)/2+a,rect(4)/2.6+a);
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a,rect(4)/2.6+a, rect(3)/2+a,rect(4)/2.6-a);
    Screen('FrameOval', MyScreen , [255,255,255], CenterRect([0,0,100,100],rect2));
    DrawFormattedText(MyScreen,'The numbers will appear quickly.\n\nDo not get overwhelmed.\n\nThis sign will come up quickly after each number:','center', rect(3)/12, [255 255 255]);
    DrawFormattedText(MyScreen,'You may still press the SPACE BAR during this time\n\n\n\nDo not press anything for the number 3.','center', rect(3)/3.5, [255 255 255]);
    DrawFormattedText(MyScreen,'Press the SPACE BAR to start the practice trial','center', rect(3)/2, [255 255 255]);
    Screen('Flip', MyScreen);
    WaitSecs(2); %wait 2 seconds before waiting for a key press. To avoid changing the screen by mistake
    KbWait;
    WaitSecs(1); 
     end
    DrawFormattedText(MyScreen,'Ready...','center', 'center', [255 255 255]);
    Screen('Flip', MyScreen);
    WaitSecs(2); 
    HideCursor() %hide the cursor
    [KeyIsDown,secs, keyCode]=KbCheck; %register any key pressed
    space=KbName('space'); %code number for the space bar
    DrawFormattedText(MyScreen,'Go!','center', 'center', [255 255 255]);
    Screen('Flip', MyScreen);
    WaitSecs(1);
    trial=18  ; %numbers of trials
    rt=zeros(1,max(trial)); %the vector which will store the rts
    scoreSart=zeros(1,max(trial)) ; %vector for the score
    falseAlarm=zeros(1,max(trial)); %vector for mistakenly press the space bar for the 3
    %Draw the Fixation Cross
    oval_size=[0,0,100,100];
    frame=CenterRect(oval_size,rect);
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a, rect(4)/2-a,rect(3)/2+a,rect(4)/2+a);
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a,rect(4)/2+a, rect(3)/2+a,rect(4)/2-a);
    Screen('FrameOval', MyScreen , [255,255,255], frame);
    %Present the fixation
    fixation_onset=Screen('Flip', MyScreen);
    WaitSecs(0.9-slack); %90 sec for the cross
    for trial=1:max(trial) %repeat this 18 times
    %extract a number with rand as index
    numberdisp=num2str(numbersTorder1(trial));%the number dipslyed as a string
    %Draw the first stimulus
    size=textsize(randperm(3,1)); 
    Screen('TextSize', MyScreen, size) ;
    Screen('TextFont', MyScreen, 'Symbol');
    
    DrawFormattedText(MyScreen,numberdisp,'center', rect(4)/2+size/2 , [255 255 255],[],[],[],[], [],frame);
    
    %Screen('DrawText', MyScreen, numberdisp, xp, yp, [255 255 255]);
    %Screen('DrawText', MyScreen, numberdisp, rect(3)/2-size/2.5, rect(4)/2-size/2,[255,255,255]);
    %present the first stimulus 0.5 sec after the onset of the fixation
    firststimulus_onset=Screen('Flip', MyScreen); %get the onset time
    %firststimulus_offset=Screen('Flip', MyScreen, firststimulus_onset+0.25);
    t0=GetSecs; %take the time
    [KeyIsDown, secs, keyCode]=KbCheck;
    %keep the stimulus on screen for 0.25 seconds
    %firststimulus_offset=Screen('Flip', MyScreen, firststimulus_onset+0.25-slack);
    
    %Present the fixation
    %Draw the Fixation
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a, rect(4)/2-a,rect(3)/2+a,rect(4)/2+a);
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a,rect(4)/2+a, rect(3)/2+a,rect(4)/2-a);
    Screen('FrameOval', MyScreen , [255,255,255], frame);
    %Present the fixation cross after 0.25 sec and keep it on for 0.90 sec
    fixation_onset=Screen('Flip', MyScreen, firststimulus_onset+0.25-slack);
    fixation_offset=Screen('Flip', MyScreen, fixation_onset+0.9-slack);
    end

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Experimental trials
    Screen('TextFont', MyScreen, 'Arial');
    Screen('TextSize', MyScreen, 25);
    DrawFormattedText(MyScreen,'Thank you for completing the practice trial!\n\nPlease press the SPACE BAR to continue to the experimental trials.','center', 'center' , [255 255 255]);
    Screen('Flip', MyScreen);
    WaitSecs(2);
    KbWait;
    DrawFormattedText(MyScreen,'Ready...','center', 'center', [255 255 255]);
    Screen('Flip', MyScreen);
    WaitSecs(2);
    DrawFormattedText(MyScreen,'Go!','center', 'center', [255 255 255]);
    Screen('Flip', MyScreen);
    WaitSecs(1);
    trial= 225;%length(trial) %%%%%%%%%%%%%%%%%%%%%%%%%%%number of trials
    rt=zeros(1,max(trial));
    scoreSart=zeros(1,max(trial)) ;
    score3=0; %score 3 can't be of the same length of trials length because they are supposed to be 25 3s, randomly distributed
    j=1; % we are creating a counter for the 3 score. When the 3 first appears, its scoring will be stored as the first value of variable "score3". then the counter will be j+1
    %Draw the Fixation
    oval_size=[0,0,100,100];
    frame=CenterRect(oval_size,rect);
    %Draw the Fixation
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a, rect(4)/2-a,rect(3)/2+a,rect(4)/2+a);
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a,rect(4)/2+a, rect(3)/2+a,rect(4)/2-a);
    Screen('FrameOval', MyScreen , [255,255,255], frame);
    %Present the fixation
    fixation_onset=Screen('Flip', MyScreen);
    WaitSecs(0.9-slack); 
    for t=1:max(trial)
    num=numbersTorder2(t);
    numberdisp=num2str(num);%the number dipslyed as a string
    %Draw the first stimulus
    size=textsize(randperm(3,1));
    Screen('TextSize', MyScreen, size) ;
    Screen('TextFont', MyScreen, 'Symbol');
    DrawFormattedText(MyScreen,numberdisp,'center' , rect(4)/2+size/2, [255 255 255],[],[],[],[], [],frame);
    %center text
    
    %Screen('DrawText', MyScreen, numberdisp ,'center', 'center', [255,255,255]);
    %Screen('DrawText', MyScreen, numberdisp, rect(3)/2-size/2, rect(4)/2-size/2,[255,255,255]);
    %present the first stimulus 0.5 sec after the onset of the fixation
    firststimulus_onset=Screen('Flip', MyScreen); %get the onset time
    %firststimulus_offset=Screen('Flip', MyScreen, firststimulus_onset+0.25);
    t0=GetSecs;
    [KeyIsDown, secs, keyCode]=KbCheck;
    %keep the stimulus on screen for 0.25 seconds
    %firststimulus_offset=Screen('Flip', MyScreen, firststimulus_onset+0.25-slack);
    
    %Present the fixation
    %Draw the Fixation
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a, rect(4)/2-a,rect(3)/2+a,rect(4)/2+a);
    Screen('DrawLine', MyScreen, [255,255,255],rect(3)/2-a,rect(4)/2+a, rect(3)/2+a,rect(4)/2-a);
    Screen('FrameOval', MyScreen , [255,255,255], frame);
    %Present the fixation
    fixation_onset=Screen('Flip', MyScreen, firststimulus_onset+0.25-slack);
   
     while keyCode(space)==0 &&( secs-firststimulus_onset)<1.15
        [KeyIsDown, secs, keyCode]=KbCheck;               %register any key press within the presentation of the number and then the subsequent cross (1,15 sec overall)
        %firsttouch=1;
    end
     rt(t)=secs-t0;%store the reaction time as difference between the time when the bar is pressed and the pressentation of the stimulus
     fixation_offset=Screen('Flip', MyScreen, fixation_onset+0.9-slack);
            if ((num==3 && keyCode(space)==0) ||   (num~=3 && keyCode(space)==1)) 
            scoreSart(t)=1 ; %score is when participant does not press the space bar for the 3, but presses it for any other number
         %elseif ((num==3 && keyCode(space)==1))
                 %scoreSart(t )=1; %if the space is pressed while the 3 is presented, it is a false alarm
            end 
            if  (num==3 && keyCode(space)==0) %score only for the trial with the 3
                 score3(j)=1;
                 j=j+1;
            else if(num==3 && keyCode(space)==1) %score only for the trial with the 3
                 score3(j)=0;
                 j=j+1;
                end
            end
           fixation_onset=Screen('Flip', MyScreen); %last fixation cross
   
    % if keyCode(space)==1 && firsttouch==0
      %rt=secs-t0;
      %firsttouch=1;
     %end
   
    end  
     
    Screen('TextSize', MyScreen, 25);
    Screen('TextFont', MyScreen, 'Arial');
    DrawFormattedText(MyScreen,'Thank You!!!','center', 'center', [255 255 255]);
    Screen('Flip', MyScreen);
    WaitSecs(3);
    Screen('CloseAll');
    ShowCursor(); 
    
   score3Tot=sum(score3); % sum all the correct responses for trials with the number 3
   
   SartScore.rt=0;   %create the struct to store all the variables
   SartScore.score=scoreSart;
   SartScore.MrtCORR=mean(rt(scoreSart==1)); %sart score only for correct resposne
   SartScore.scoretot=sum(scoreSart);
   SartScore.scoreper=(sum(scoreSart)/max(trial))*100;
   SartScore.meanRT=mean(rt(scoreSart ==1));
   SartScore.FalseAlarmTot=sum(falseAlarm);
   SartScore.FalseAlarmPer=(sum(falseAlarm)/max(trial)) *100;
   SartScore.score3Tot=score3Tot;
   SartScore.errors3=count(num2str(score3),'0'); %participant pressed space bar for 3s
   
   %Screen('CloseAll')
   
   SubjNr=num2str(SubjNr);
   experimenter=num2str(experimenter);
   folder=[experimenter];
   if (exist(folder)==0) % if the folder with the name of the experimenter does not exist, it will be created
       mkdir(folder);
   end
  
   
   
   filename=[experimenter, '/', SubjNr]; %save files in different folders for different experimenter
   save(filename, 'SartScore');
   %export the score and rts
   %scoreSart=scoreSart';
   %rtSart=rt';
   %Table=table(scoreSart,rtSart);
   %xlswrite(filename, (SartScore.rt)');
    %ifi = Schreen('GetFlipInterval', window);
   
catch
   % Screen('CloseAll')
    rethrow(lasterror)

end 
end
