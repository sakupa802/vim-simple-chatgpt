function! chat_gpt#ChatGPT(message) abort
  if executable('curl')
    let url = "https://api.openai.com/v1/chat/completions"
    let json = '{"model": "gpt-3.5-turbo", "messages": [{"role": "user", "content": "'. a:message . '"}]}'
    let cmd = 'curl -s -X POST -H "Authorization: Bearer ' . g:openai_api_key . '" "Content-Type: application/json" -d "' . json . '" ' . url
    let result = json_decode(system(cmd))

    if result['choices']
      echo result['choices']['content']
    else
      echoerr result
    endif
  else
    echoerr 'error! curl not available.'
  endif
endfunction
