[server]
ip = "0.0.0.0"
port = 8000
region = "${aws_region}"
service = "kms-xks-proxy"

[server.tcp_keepalive]
tcp_keepalive_secs = 60
tcp_keepalive_retries = 3
tcp_keepalive_interval_secs = 1

[tracing]
is_stdout_writer_enabled = true
is_file_writer_enabled = true
level = "INFO"
directory = "/var/local/xks-proxy/logs"
file_prefix = "xks-proxy.log"
rotation_kind = "HOURLY"

[security]
is_sigv4_auth_enabled = true
is_tls_enabled = false
is_mtls_enabled = false

[tls]
tls_cert_pem = "tls/server_cert.pem"
tls_key_pem = "tls/server_key.pem"
mtls_client_ca_pem = "tls/client_ca.pem"
mtls_client_dns_name = "us-east-2.alpha.cks.kms.aws.internal.amazonaws.com"

[[external_key_stores]]
uri_path_prefix = "/xyz"
sigv4_access_key_id = "AKIA4GBY3I6JCE5M2HPM"
sigv4_secret_access_key = "1234567890123456789012345678901234567890123="
xks_key_id_set = ["key1", "key2", "key3", "key4", "key5", "key6", "key7", "key8", "key9"]

[pkcs11]
session_pool_max_size = 30
session_pool_timeout_milli = 0
session_eager_close = false
user_pin = ""
PKCS11_HSM_MODULE = "${path_libvault_pkcs11}"
context_read_timeout_milli = 100

[limits]
max_plaintext_in_base64 = 8192
max_aad_in_base64 = 16384

[hsm_capabilities]
can_generate_iv = false
is_zero_iv_required = false
