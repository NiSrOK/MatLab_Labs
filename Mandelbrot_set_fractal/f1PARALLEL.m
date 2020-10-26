function [f1] = f1PARALLEL(varargin)
persistent f1_;
if ~isempty(varargin), f1_ = varargin{1}; end
f1 = f1_; 