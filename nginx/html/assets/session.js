const $helloInput = document.getElementById('hello');
const $worldInput = document.getElementById('world');
const $submitButton = document.getElementById('submit');
const $getSessionButton = document.getElementById('get-session');
const $result = document.getElementById('result');

$submitButton.addEventListener('click', async () => {
  const payload = {
    hello: $helloInput.value,
    world: $worldInput.value,
  };
  const response = await fetch('http://localhost:3005/sample/api/session/post', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(payload),
    credentials: 'include',
  });

  showResponseToResult(response);
});

$getSessionButton.addEventListener('click', async () => {
  const response = await fetch('http://localhost:3005/sample/api/session/get', {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    },
    credentials: 'include',
  });

  showResponseToResult(response);
});

async function showResponseToResult(response) {
  $result.innerHTML = '';

  const responseJson = await response.json();
  console.log(responseJson);
  $result.innerHTML = JSON.stringify(responseJson);
}
