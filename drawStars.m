function [  ] = drawStars( y_values,p_values,thresh,shift,x_position )
    % Draw the statistical significance stars for the data in y_values,
    % with p_values, using the values in thresh for the number of stars
    
    % We assume that using univarscatter, the x positions are 1:size(y_values,2)
    if nargin<5||isempty(x_position) 
        x_stars = 1:size(y_values,2);
    end
    y_stars = max(y_values)+shift;
    
    if numel(p_values)~=size(y_values,2)
        error('Number of p_values differ from number of observations');
    end
    
    for i = 1:numel(p_values)
        stars='';
        for j = 1:numel(thresh)
            if p_values(i)<thresh(j)
                stars = [stars '*'];
            end
        end
        if ~isempty(stars)
            text(x_stars(i),y_stars(i),stars,'HorizontalAlignment','Center','Fontsize',25);
        end
        
    end
    
end

