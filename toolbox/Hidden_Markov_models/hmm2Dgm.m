function dgm = hmm2Dgm(model, T, varargin)
%% Convert an hmm model to a dgm of by unrolling the hmm for T time steps
% All other args are passed directly to dgmCreate
%%


G = diag(ones(T-1, 1), 1); 
CPD1 = tabularCpdCreate(model.pi); 
CPD2 = tabularCpdCreate(model.A); 
localCPD = model.emission; 
dgm = dgmCreate(G, {CPD1, CPD2}                            , ...
                   'localCPDs'       , localCPD            , ...
                   'CPDpointers'     , [1, 2*ones(1, T-1)] , ...
                   'localCPDpointers', ones(1, T)          , ...
                   varargin{:}                             ); 




end