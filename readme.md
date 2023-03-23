# Controller Decorator Bug

The Controller Decorator always calls non-overridden methods on `coldbox.system.web.Controller`,
even when the Controller has been replaced.  This is the case in ColdBox testing where
`coldbox.system.testing.mock.web.MockController` is used instead.

What this means in practice is that ColdBox attempts to actually call `cflocation` when calling
`relocate` instead of saving the `relocate` values off to the request collection.

## See the bug

1. `box install`
2. `server start`
3. Open `/tests/runner.cfm`
4. See that the test runs successfully
5. Remove the comment in `config/ColdBox.cfc` so that we define a `controllerDecorator`
6. Re-run the test.
7. See that `relocate` called `cflocation`