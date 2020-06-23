# pvinis dotfiles, handled by chezmoi

## Secrets

### Read from 1password
`op get item "pear known data" |jq`

### Get password in `.tmpl` files

- from "password" type
```
export HOMEBREW_GITHUB_API_TOKEN={{ (onepassword "jcvvcmjdutdbvmpep3zq").details.password }}
```

- from "login" type
```
export HOMEBREW_GITHUB_API_TOKEN={{ range (onepassword "jcfvvjdutd4vmpep3s3z").details.fields -}}
  {{ if eq .name "password" }}
    {{ .value }}
  {{ end }}
{{- end }}
```

- from "note" type
```
{{ (onepassword "pear known data").details.notesPlain }}
```

## TODO
- add instructions on how to init a new machine
