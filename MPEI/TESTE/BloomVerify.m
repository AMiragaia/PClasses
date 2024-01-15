function [R] = BloomVerify(Bloom, elem, k)
%BLOOMVERIFY Summary of this function goes here
%   Detailed explanation goes here
    R = 1;
    n = length(Bloom);
   
    for i=1:k
        elem = [elem int2str(i)];
        index = mod(string2hash(elem),n)+1;  
        if Bloom(index) ~= 1
            R = 0;
    end
end

