function git_diff_stat
    if test (count $argv) -ne 1
        echo "Usage: git_diff_stat <parent-branch>"
        return 1
    end

    set parent_branch $argv[1]

    # Get the list of commits from the parent branch to HEAD
    set commits (git rev-list --reverse $parent_branch..HEAD)

    if test (count $commits) -eq 0
        echo "No new commits found from $parent_branch to HEAD."
        return 0
    end

    # Iterate over each commit and show its diff --stat compared to the previous one
    set prev_commit $parent_branch
    for commit in $commits
        echo "Commit: $(git rev-parse --short $commit) $(git log -1 --pretty=%s $commit)"
        git diff --stat $prev_commit $commit
        echo ""
        set prev_commit $commit
    end
end
