function [  ] = drawStars( y_values,p_values,thresh,shift,x_position,show_stars,text_varargin)
    % [  ] = drawStars( y_values,p_values,thresh,shift,x_position,show_stars,text_varargin)    
    % - y_values: values of y as returned by UnivarScatter
    % - p_values: p-values for each category, as indicated by the columns in
    % y
    % - thresh: array containing the threshold of significance, for example
    % [0.05, 0.005] if you want * if p<0.05 and ** p<0.005.
    % - shift: distance from the maximum point of each category where you
    % want the star to be
    % - x_position: the position of the center of each category on the
    % x-axis, this should go from 1 to size(y,2) if you use the default
    % version of UnivarScatter.
    % - show_stars: boolean variable, true if you want significance to be
    % represented by stars, false if you want to have "p<0.05" or whatever
    % you introduced in the variable thresh.
    % - text_varargin: varargin argument to the text function that will
    % draw the stars or write the text (you can specify font, size etc.)
    
    % We assume that using univarscatter, the x positions are 1:size(y_values,2)
    if nargin<5||isempty(x_position)
        x_stars = 1:size(y_values,2);
    end
    
    if nargin<6||isempty(show_stars)
        show_stars = true;
    end
    
    if nargin<7||isempty(text_varargin)
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
                if show_stars == 1
                    stars = [stars '*'];
                elseif show_stars == 2
                    stars = sprintf('p=%.1E',p_values(i));
                else
                    stars = sprintf('p<%.4f',thresh(j));
                end
            end
        end
        if ~isempty(stars)
            text(x_stars(i),y_stars(i),stars,'HorizontalAlignment','Center',text_varargin{:});
        end
        
    end
    
end

