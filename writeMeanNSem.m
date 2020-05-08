function [  ] = writeMeanNSem( y_values,shift,x_position,text_varargin,isbottom )
    % writeMeanNSem( y_values,shift,x_position,text_varargin )
    % Write the value of the mean plus minus 95% CI
    
    
    if nargin<4||isempty(text_varargin)
        text_varargin = {};
    end
    
    % We assume that using univarscatter, the x positions are 1:size(y_values,2)
    if nargin<3||isempty(x_position) 
        x_text = 1:size(y_values,2);
    end
    
    if nargin<5||isempty(isbottom)
        isbottom=true;
    end
    if isbottom
        y_text = min(y_values)-shift;
    else
        y_text = max(y_values)+shift;
    end
    all_mean = nanmean(y_values);
    all_std = nanstd(y_values);
    all_nb_obs = nansum(~isnan(y_values));
    all_95CI = 1.96*all_std./sqrt(all_nb_obs);
    
    for i = 1:size(y_values,2)
        text_value = sprintf('%.2f \\pm %.2f',all_mean(i),all_95CI(i));
        text(x_text(i),y_text(i),text_value,'HorizontalAlignment','Center',text_varargin{:});

        
    end
    
end

