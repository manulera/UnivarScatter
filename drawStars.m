function [  ] = drawStars( y_values,p_values,thresh,shift,x_position,text_varargin)
    % Draw the statistical significance stars for the data in y_values,
    % with p_values, using the values in thresh for the number of stars
    
    % We assume that using univarscatter, the x positions are 1:size(y_values,2)
    if nargin<5||isempty(x_position)
        x_stars = 1:size(y_values,2);
    end
    
    if nargin<6||isempty(text_varargin)
        text_varargin = {};
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
                stars = sprintf('p<%.3f',thresh(j));
            end
        end
        if ~isempty(stars)
            text(x_stars(i),y_stars(i),stars,'HorizontalAlignment','Center',text_varargin{:});
        end
        
    end
    
end

