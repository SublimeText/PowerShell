import logging

logFormatter = logging.Formatter('%(asctime)s: %(thread)d: %(levelname)s: %(message)s')

log = logging.getLogger('PowerShell')
log.setLevel(logging.DEBUG)

console = logging.StreamHandler()
console.setLevel(logging.DEBUG)
console.setFormatter(logFormatter)
log.addHandler(console)

log.info("Logging started.")