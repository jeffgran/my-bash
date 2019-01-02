# Fish git prompt

set __fish_git_prompt_color_branch red
set __fish_git_prompt_color_upstream_ahead --bold brblue
set __fish_git_prompt_color_upstream_behind --bold brblue
set __fish_git_prompt_color_stagedstate red
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_untrackedfiles --bold brblue
set __fish_git_prompt_color_cleanstate brgreen

set __fish_git_prompt_show_informative_status 'yes'

function fish_prompt
    set last_status $status

    set_color yellow
    printf '%s' (prompt_pwd)

    set_color normal
    printf '%s' (__fish_git_prompt)

    set_color cyan
    printf ' fish ~> '
end
