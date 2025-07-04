// Expected usage of the plugin will need to be adjacent strings due to format
// and also be longer than 80 chars.
// ignore_for_file: no_adjacent_strings_in_list, lines_longer_than_80_chars

import 'package:mason/mason.dart';
import 'package:test/test.dart';

import '../../../helpers/command_helper.dart';

const _expectedPackagesUsage = [
  'Command for managing packages.\n'
      '\n'
      'Usage: very_good packages <subcommand> [arguments]\n'
      '-h, --help    Print this usage information.\n'
      '\n'
      'Available subcommands:\n'
      '  check   Perform checks in a Dart or Flutter project.\n'
      '  get     Get packages in a Dart or Flutter project.\n'
      '\n'
      'Run "very_good help" to see global options.',
];

void main() {
  group('packages', () {
    test(
      'help',
      withRunner((commandRunner, logger, pubUpdater, printLogs) async {
        final result = await commandRunner.run(['packages', '--help']);
        expect(printLogs, equals(_expectedPackagesUsage));
        expect(result, equals(ExitCode.success.code));

        printLogs.clear();

        final resultAbbr = await commandRunner.run(['packages', '-h']);
        expect(printLogs, equals(_expectedPackagesUsage));
        expect(resultAbbr, equals(ExitCode.success.code));
      }),
    );
  });
}
