# Global Claude Code Instructions

## Session Start
**First step of every session**: Check repository sync status
1. Query GitHub for list of all repositories in the `fd1conference` organization using `gh repo list fd1conference`
2. Check the local machine (home directory and common project locations) to identify which of those repositories have been cloned locally
3. For each local repository found:
   - Run `git fetch origin` to update remote tracking branches
   - Compare local branch with remote using `git status` or `git rev-list`
   - Report to user if any repositories are behind, ahead, or diverged from remote
4. If the `dotfiles` repository specifically has updates available:
   - Pull the changes with `git pull origin main`
   - Run `./sync.sh` to sync configurations and credentials
5. Only proceed with other user-requested tasks after completing this repository sync check

## Git Commits
- Never include Claude Code attribution or self-promotion in commit messages or code comments
- Do not add "Generated with Claude Code" or "Co-Authored-By: Claude" to commits

## General Coding Philosophy
- Always seek and overall understanding of the project you are working on before making decisions. Important context will generally be provided by README, CHANGELOG, SESSION HANDOFF and similar files, as well as directories and lists when appropriate. First review these files, then the code itself, and only then begin analysis and recommendations 
- Always favor solutions that are simpler and more minimalistic in their approach, when that can be accomplished without major drawbacks in functionality. When all else is equal you should always favor fewer configuration files, fewer documentation files, fewer project subsections. 
- If a program you are modifying has code that accomplishes an important function, you should avoid recreating that functionality elsewhere in the program unless it is necessary. 

## General Approach
- Always try to avoid unnecessary interpolation and guessing. For example if asked about a framework or program or other technical platform are area where a web search for documentation will yield significant results, read that documentation before formulating a reply. 
- When, by necessity you need to make assumptions or guesses on how a system works, or what the intentions are of a project, always seek confirmation of your educated guesses by the user. 
- When asking the user for information, avoid open ended or vague questions asking the user to create a comprehensive overview or summary for you. Instead, gather as much context as you can, while regularly seeking to confirm and test your understanding by asking for user feedback.  
- As knowledge is gained by user interaction, make sure to memorialize it in the project's documentation files regularly. 
