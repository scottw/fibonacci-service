# fibonacci-service

A small web service that returns a portion of the Fibonacci sequence.

Usage:

    ./fibonacci daemon

Then:

    $ curl http://localhost:3000/10
    [0,1,1,2,3,5,8,13,21,34]

## Development

Set up your development environment with Carton:

    $ carton install

If you don't have Carton, install it:

    $ cpanm Carton

## Testing

Test this application with:

    $ ./fibonacci test

## Deployment

Deploy this application with:

    $ carton bundle

Then rsync this directory to the host and run:

    $ carton install --cached --deployment
