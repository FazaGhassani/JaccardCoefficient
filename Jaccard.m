function [] = Jaccard(ratings,items)
%function that, given two diverent movie IDs as input, 
%outputs the Jaccard coefcient: the number of users who rated both movies divided by the number of
%users who rated at least one of the movies.

%Faza Ghassani - 1301144270
%github : https://github.com/FazaGhassani

%=========================================================================================================
%Using Jaccard
%Input Movie name
namaMovie1 = input('masukan nama movie pertama : ','s');
namaMovie2 = input('masukan nama movie kedua : ','s');

%search on items and take the ID
k = 1;
for i=1:length(items)
    if (strcmp(items{k,i},namaMovie1))
        id1 = i;
        disp(['id untuk ',namaMovie1,':']); disp(id1);
    end
end

k = 1;
for i=1:length(items)
    if (strcmp(items{k,i},namaMovie2))
        id2 = i;
        disp(['id untuk ',namaMovie2,':']); disp(id2);
    end
end

%id1 = for id movie1, 
%id2 = for id movie2
%sorting ratings
rowsid1 = find(ratings(:,2)==id1);
rowsid2 = find(ratings(:,2)==id2);
rayid1 = ratings(rowsid1,:);
rayid2 = ratings(rowsid2,:);

%search how many user review both of the movie
rateboth = 0;
rateone = 0;
for i=1:943
    if(find(rayid1(:,1)==i))
        if (find(rayid2(:,1)==i))
            rateboth = rateboth + 1;
        else
            rateone = rateone + 1;
        end
    else if(find(rayid2(:,1)==i))
            if(find(rayid1(:,1)==i))
                rateboth = rateboth + 1;
            else
                rateone =  rateone + 1;
            end
        end
    end
end
disp(rateboth);
disp(rateone);

jaccard = rateboth/rateone;
disp(jaccard);

end

