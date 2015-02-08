find ./ -print0 | xargs -0 perl-rename 's{[\\:*?"<>|]}{_}g'
find ./ -print0 | xargs -0 perl-rename 's{[&]}{+}g'
find ./ -print0 | xargs -0 perl-rename 's{[^]}{_}g'
