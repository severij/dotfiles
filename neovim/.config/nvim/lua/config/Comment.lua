local load_successful, Comment = pcall(require, 'Comment')

-- In case Comment isn't installed yet:
if not load_successful then return end

Comment.setup()
