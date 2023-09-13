class gitMaker
    =begin
    A gitmaker class which will inititalize the git,
        commit to the git,push to the git, branch to the git,
    generate the rsa pub files for the git account and you 
    dont have to remember, simply install the class and then
    invokve it from anywhere. 
    =end
    def initialize(dir_path, filename,commit_message,branch)
    @dirpath = dir_path
    @filename =  filename
    @commit = commit_message
    @branch = branch
    end
    def gitinitialize(dir_path)
        @dir_path = dir_path
        Dir.chdir(@dir_path)
        `git init .`
          puts "git init has been initiliazed"
    end
    def gitadd(dir_path, 
                  all_files, filename)
        @dir_path = dir_path
        @file = filename
        Dir.chdir(@dir_path)
        if all_files
          `git add .`
        end
        exit 1
        if filename
            `git add @filename`
        end
        exit 1
    end
    def gitcommit(dir_path, commit_message)
        @dir_path = dir_path
        @commit = commit_message
          `git commit -m @commit`
            puts "git commit has been done with the #{@commit}"
    end
    def gitbranch(dir_path, branchname)
        @dir_path = dir_path
        @branch_name = branchname
        Dir.chdir(@dir_path)
        `git branch -M @branch_name`
        puts "git has been branched to the following branch #{@branch_name}"
    end 
    def gitpush(dir_path, branchname)
        @dir_path = dir_path
        @branch_name = branchname
        Dir.chdir(@dir_path)
        `git push -u origin @branchname`
        puts "git has bee been pushed to the following branch with the commit message #{@commit} "
    end
    def gitset(email)
        @email_auth = email
        `ssh-keygen -t rsa -b 4096 -C @email`
        @dir_path = "Users"+"/"+`users`.strip+"./ssh"
        Dir.chdir(@dir_path)
        `cat "Users"+"/"+`users`.strip+"./ssh"+"id_rsa.pub"`
    end
end
