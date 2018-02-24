function display_candles(high, low, close, open, color, date, titles)
    figure(1);
    % plot(tsla_data.date, tsla_data.close); % plotting data according close value 
    candle(high, low, close, open, color, date);
    grid on;
    
    
    % adding information about graph
    title(titles);
    xlabel('Time Elapsed') % x-axis label
    ylabel('Stock Price (USD)') % y-axis label
end