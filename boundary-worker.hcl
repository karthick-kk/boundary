listener "tcp" {
    purpose = "proxy"
    address = "192.168.99.102"
    tls_disable = true
}

worker {
  # Name attr must be unique across workers
  name = "demo-worker-1"
  description = "A default worker created demonstration"

  # Workers must be able to reach controllers on :9202
  controllers = [
    "192.168.99.102"
  ]

  public_addr = "192.168.99.102"
}

# must be same key as used on controller config
kms "aead" {
    purpose = "worker-auth"
    aead_type = "aes-gcm"
    key = "8fZBjCUfN0TzjEGLQldGY4+iE9AkOvCfjh7+p0GtRBQ="
    key_id = "global_worker-auth"
}
