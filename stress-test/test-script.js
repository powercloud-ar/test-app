import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  vus: 50,           // Virtual Users
  duration: '30s',   // Duración del test
};

export default function () {
  let res = http.get(`${__ENV.TARGET_URL}`);
  check(res, {
    'status is 200': (r) => r.status === 200,
  });
  sleep(1);
}
