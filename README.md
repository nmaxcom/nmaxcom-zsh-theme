# nmaxcom-zsh-theme

Best zsh theme in town! Homemade with 💙

Just get yourself http://ohmyz.sh and use my theme.


![](https://i.imgur.com/vG7jeuK.png)

I wanted to have an immaculate look by default and whenever possible. Still, this simple beauty has a couple tricks up its sleeve.

When I work through SSH, I always use *tmux* on the other machine, so I don't need the feel to add the host and so on and clutter that beautiful prompt.

On the right, we have the time, and just on its left, it'll be a small indicator I'll show in a moment.

The triangle/delta is just a symbol that I think fits nicely. It serves as a visual beacon when there's a lot of text and gives some design balance. 
You can swiftly change it for another one ([this is a good place to find others](https://unicode-table.com/en/)) or get rid of it altogether.

## Did the last command end well?

With silence outputs, you never know if the system or app tried to warn you about an unfortunate exit. Instead of add clutter with constant exit numbers, I decided to paint red the CWD if the exit is different than 0, signifying an error.

If the CWD color is unchanged, the exit was 0 (successful).

![](https://i.imgur.com/ciPuxLE.png)

Here, I just run an unexisting program and ignored the output to simulate the situation.
Using `echo $?` we can see what the last command's exit code was and it indeed wasn't 0, which would mean successful; therefore the path shows in red.

Nevermind the colors of the commands, that comes from a [zsh extension](https://github.com/zsh-users/zsh-syntax-highlighting).

## What about GIT?

Like almost anyone developing something, I use git myself, but I've grown tired of the general fashion of going overboard with way too many useless indicators.

My solution is simple. See nothing? Not in a git folder. Let's get one!

![enter image description here](https://i.imgur.com/hFNv6VU.png)
To me, that simple dot is enough. If it's orange, I have an unclean status.

## With great power comes... red
Yes, sure, always use sudo instead of the actual root account. And that is a good principle, but sometimes you just need to ride super user for a while. In order not to forget you're touching the sun, I made a couple of small changes:
![enter image description here](https://i.imgur.com/50IWWuc.png)
With that pretty red and the known pound symbol, I can now remember to log off the *foot shooter* ASAP.
