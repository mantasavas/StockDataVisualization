function display_candles(high, low, close, open, color, date, titles, tick_data)
    figure(1);
    % plot(tsla_data.date, tsla_data.close); % plotting data according close value 
    if tick_data
        candle(high, low, close, open, color);
        set(gca,'xticklabel',{[]})
    else
        candle(high, low, close, open, color, date);
        % adding information about graph
        xlabel('Time Elapsed') % x-axis label
       
    end
    
    grid on;
    
    title(titles);
    ylabel('Stock Price (USD)') % y-axis label
   
end