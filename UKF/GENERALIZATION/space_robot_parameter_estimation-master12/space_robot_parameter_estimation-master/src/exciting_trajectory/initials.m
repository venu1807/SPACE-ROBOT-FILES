function [y0, ti, tf, incr, rtol, atol] = initials()
    ti=0; tf=20;
    n = inputs();

    %Base motions
    q=[0; 0; 0; 0; 0; 0];
    dq=[0; 0; 0; 0; 0; 0];

    % Actuator energy
    acten=0;

    %Vector of all the initial State Variable
    y0=[q; dq; acten];

    %INTERATION TOLERANCES
    incr=0.1;
    rtol=1e-5;         %relative tolerance in integration 
    atol=1e-7;         %absolute tolerances in integration
end