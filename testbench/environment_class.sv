class FFT4Env;
  FFT4Driver driver;
  FFT4Monitor monitor;
  FFT4Scoreboard scoreboard;
  virtual FFT4If vif;

  function new(virtual FFT4If vif);
      this.vif = vif;
      driver = new(vif);
      monitor = new(vif);
      scoreboard = new(vif);
  endfunction
  
  task run;
      fork
        monitor.monitor();
      join_none
  endtask
endclass 
