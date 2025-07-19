class FFT4Monitor;
  virtual FFT4If vif;
  event monitor_event;
  function new(virtual FFT4If vif);
    this.vif = vif;
  endfunction  
  task monitor;
    forever begin
      @(posedge vif.clk);
      -> monitor_event; // Notify the scoreboard
    end
  endtask
endclass 
