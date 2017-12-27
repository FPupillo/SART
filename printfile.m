%script to print an excel file with data
function printfile
experimenter=input('Please enter your experiment code','s');
currDir=pwd;
cd (experimenter);
Matrix=zeros(length(dir)-2,5); %create empty matrix which is as long as the the cases
col_header={'Subj number', 'Score tot.','Score tot. 3',  'Errors', 'Mean RT'};
commaHeader = [col_header;repmat({','},1,numel(col_header))];
commaHeader = commaHeader(:)';
textHeader = cell2mat(commaHeader); %cHeader in text with commas

for i=1:(length(dir)-2)
    if i>10
    e=num2str(i);
    filename=[e,'.','mat'];
    end
    if i<10
    e=num2str(i);
    filename=['0',e,'.','mat'];
    end
    load(filename);
        
    Matrix(i,:)=[i SartScore.scoretot SartScore.score3Tot SartScore.errors3 SartScore.meanRT ]; %write results in the empty matrix
end
filename=[pwd, '.csv']; %, '\',experimenter]
%write header to file
fid = fopen(filename,'w'); 
fprintf(fid,'%s\n',textHeader);
fclose(fid);

%write data to end of file
dlmwrite(filename,Matrix,'-append');
%csvwrite(filename,col_header)
cd (currDir);
end