{ inputs, pkgs, ... }:

{
  environment.etc."attic-cache.toml".text = ''
    # Socket address to listen on
    listen = "[::]:7455"

    # Allowed `Host` headers
    #
    # This _must_ be configured for production use. If unconfigured or the
    # list is empty, all `Host` headers are allowed.
    allowed-hosts = []

    # The canonical API endpoint of this server
    #
    # This is the endpoint exposed to clients in `cache-config` responses.
    #
    # This _must_ be configured for production use. If not configured, the
    # API endpoint is synthesized from the client's `Host` header which may
    # be insecure.
    #
    # The API endpoint _must_ end with a slash (e.g., `https://domain.tld/attic/`
    # not `https://domain.tld/attic`).
    #api-endpoint = "https://your.domain.tld/"

    # Whether to soft-delete caches
    #
    # If this is enabled, caches are soft-deleted instead of actually
    # removed from the database. Note that soft-deleted caches cannot
    # have their names reused as long as the original database records
    # are there.
    #soft-delete-caches = false

    # Whether to require fully uploading a NAR if it exists in the global cache.
    #
    # If set to false, simply knowing the NAR hash is enough for
    # an uploader to gain access to an existing NAR in the global
    # cache.
    #require-proof-of-possession = true

    # JWT signing token
    #
    # Set this to the Base64 encoding of some random data.
    # You can also set it via the `ATTIC_SERVER_TOKEN_HS256_SECRET_BASE64` environment
    # variable.
    token-hs256-secret-base64 = "OGZqWFV1QnZQaHdCSm5RVGFtRlBCTWRSSHB0b0hkY3dTeG9YN0F0SFBpdzAwdklUMlpQcTRJSFFRMzROSEFaaUJSZXlHYTl2MjdLQzVIR2pRS0ZJSTlydWZlSE5kT1dsYzVFRUxXUnY3Zkc1VVVCWjlxSHVzOVZpM1IzbU16WHE="

    # Database connection
    [database]
    # Connection URL
    #
    # For production use it's recommended to use PostgreSQL.
    url = "sqlite:///mnt/drive1/Ryan/nix/attic/server.db"

    # Whether to enable sending on periodic heartbeat queries
    #
    # If enabled, a heartbeat query will be sent every minute
    #heartbeat = false

    # File storage configuration
    [storage]
    # Storage type
    #
    # Can be "local" or "s3".
    type = "local"

    # ## Local storage

    # The directory to store all files under
    path = "/mnt/drive1/Ryan/nix/attic/storage"

    # ## S3 Storage (set type to "s3" and uncomment below)

    # The AWS region
    #region = "us-east-1"

    # The name of the bucket
    #bucket = "some-bucket"

    # Custom S3 endpoint
    #
    # Set this if you are using an S3-compatible object storage (e.g., Minio).
    #endpoint = "https://xxx.r2.cloudflarestorage.com"

    # Credentials
    #
    # If unset, the credentials are read from the `AWS_ACCESS_KEY_ID` and
    # `AWS_SECRET_ACCESS_KEY` environment variables.
    #[storage.credentials]
    #  access_key_id = ""
    #  secret_access_key = ""

    # Data chunking
    #
    # Warning: If you change any of the values here, it will be
    # difficult to reuse existing chunks for newly-uploaded NARs
    # since the cutpoints will be different. As a result, the
    # deduplication ratio will suffer for a while after the change.
    [chunking]
    # The minimum NAR size to trigger chunking
    #
    # If 0, chunking is disabled entirely for newly-uploaded NARs.
    # If 1, all NARs are chunked.
    nar-size-threshold = 0 # chunk files that are 64 KiB or larger

    # The preferred minimum size of a chunk, in bytes
    min-size = 16384            # 16 KiB

    # The preferred average size of a chunk, in bytes
    avg-size = 65536            # 64 KiB

    # The preferred maximum size of a chunk, in bytes
    max-size = 262144           # 256 KiB

    # Compression
    [compression]
    # Compression type
    #
    # Can be "none", "brotli", "zstd", or "xz"
    type = "zstd"

    # Compression level
    level = 9

    # Garbage collection
    [garbage-collection]
    # The frequency to run garbage collection at
    #
    # By default it's 12 hours. You can use natural language
    # to specify the interval, like "1 day".
    #
    # If zero, automatic garbage collection is disabled, but
    # it can still be run manually with `atticd --mode garbage-collector-once`.
    interval = "7 days"

    # Default retention period
    #
    # Zero (default) means time-based garbage-collection is
    # disabled by default. You can enable it on a per-cache basis.
    default-retention-period = "3 months"
  '';
  systemd.services.attic-cache = {
    wantedBy = [ "multi-user.target" ];
    description = "Attic Nix binary cache";
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      ExecStart = ''${inputs.attic.packages.${pkgs.system}.attic}/bin/atticd -f /etc/attic-cache.toml'';
    };
  };
}
