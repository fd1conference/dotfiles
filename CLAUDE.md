# Global Claude Code Instructions

## Git Commits
- Never include Claude Code attribution or self-promotion in commit messages or code comments
- Do not add "Generated with Claude Code" or "Co-Authored-By: Claude" to commits

## Session Start (Git-Enabled Projects)
- At the beginning of any session in a git-enabled project, check if the local branch is up to date with the remote repository
- Inform the user if there are any differences between local and remote branches before making any modifications
- Let the user know if they need to pull changes before proceeding

## General Coding Philosophy
- Always seek and overall understanding of the project you are working on before making decisions. Important context will generally be provided by README, CHANGELOG, SESSION HANDOFF and similar files, as well as directories and lists when appropriate. First review these files, then the code itself, and only then begin analysis and recommendations 
- Always favor solutions that are simpler and more minimalistic in their approach, when that can be accomplished without major drawbacks in functionality. When all else is equal you should always favor fewer configuration files, fewer documentation files, fewer project subsections. 
- If a program you are modifying has code that accomplishes an important function, you should avoid recreating that functionality elsewhere in the program unless it is necessary. 

## General Approach
- Always try to avoid unnecessary interpolation and guessing. For example if asked about a framework or program or other technical platform are area where a web search for documentation will yield significant results, read that documentation before formulating a reply. 
- When, by necessity you need to make assumptions or guesses on how a system works, or what the intentions are of a project, always seek confirmation of your educated guesses by the user. 
- When asking the user for information, avoid open ended or vague questions asking the user to create a comprehensive overview or summary for you. Instead, gather as much context as you can, while regularly seeking to confirm and test your understanding by asking for user feedback.  
- As knowledge is gained by user interaction, make sure to memorialize it in the project's documentation files regularly. 
