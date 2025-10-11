return {
  settings = {
    perlnavigator = {
      perlPath = 'perl',
      enableWarnings = true,
      perltidyProfile = '',
      perlcriticProfile = '',
      perlcriticEnabled = true,
      includePaths = {
        vim.fn.expand('$HOME') .. '/Projects/wanon2',
        vim.fn.expand('$HOME') .. '/perl5/lib/perl5',
      },
    }
  }
}
