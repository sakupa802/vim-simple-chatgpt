function! chat_gpt#ChatGPT(message) abort
  if executable('curl')
    let url = "https://api.openai.com/v1/chat/completions"
    let json = "'{\"model\": \"gpt-3.5-turbo\", \"messages\": [{\"role\": \"user\", \"content\": \"". a:message . "\"}]}'"
    let cmd = 'curl -s -H "Authorization: Bearer ' . g:openai_api_key . '" -H "Content-Type: application/json" -d ' . json . ' ' . url
    let result = json_decode(system(cmd))

    if has_key(result, 'choices')
      echo result['choices']['message']['message']['content']
    else
      echoerr result
    endif

  else
    echoerr 'error! curl not available.'
  endif
endfunction
