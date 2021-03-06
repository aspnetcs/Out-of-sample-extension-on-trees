function [ C ] = tree2nested( T )
%---------------------------------------------------------------
% The final step of the algorithm - extract the elements of the basis from
% the tree.
% 
% Input
%  T - a tree class variable. The data (key) of each node is a 1X2 or 1X3 
%      cell, according to being a leaf or not, respectively.
%
% Output
%  S - the basis, pack in sparse matrix
%
%---------------------------------------------------------------
% Nir Sharon June 2013
%---------------------------------------------------------------


% get the list of nodes
bfs_node_list = T.bfsiterator;
m = length(bfs_node_list);


val = T.getkey(bfs_node_list(1));

[N,k] = size(val{2});

% main loop
C = [];
for j=1:m
    
    val = T.getkey(bfs_node_list(j));
    ind = val{1};
    V = zeros(N,k);
    V(ind,1:(size(val{2},2))) = val{2}; 
        C = sparse([C,V]);
end


end

