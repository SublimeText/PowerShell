from datetime import datetime
from subprocess import check_output
from subprocess import PIPE
import glob
import json
import os
import shutil


_THIS_DIR = os.path.abspath(os.path.dirname(__file__))
PROJECT_ROOT = os.path.dirname(_THIS_DIR)
CHANGELOG = 'CHANGELOG.txt'


def report_vcs(path):
    """
    Returns `None` if no repository is found.

    @path
      Root directory to start searching for a vcs repository.
    """
    assert os.path.exists(path), 'bad arguments'
    if os.path.exists(os.path.join(path, '.git')):
        return 'git'


def get_latest_tag(vcs=None):
    if vcs == 'git':
        try:
            out = check_output(['git', 'describe', '--tags'], shell=True)
        except Exception as err:
            print('git command failed')
            print('=' * 80)
            print(err)
            print('=' * 80)
            return
        else:
            return out.decode('ascii').rsplit('-', 2)[0]

    raise NotImplementedError('unknown vcs: ' + vcs)


def get_commit_messages(vcs=None, since_tag=None):
    """
    Returns a list of commmit summary lines.

    @vcs
      Name of vcs used.

    @since_tag
      Get messages from this tag to the repo's head.
    """
    assert vcs == 'git', 'unsupported vcs: ' + vcs
    assert since_tag, 'bad arguments'
    try:
        out = check_output(
                    'git log "{0}^{{}}..HEAD" --format=%s'.format(since_tag),
                    shell=True)
    except Exception as e:
        print('git command failed')
        raise
    else:
        return out.decode('utf-8').replace('\r', '').split('\n')


def make_message_file(old_tag, new_tag):
    """
    Creates a new messages/<new_tag>.txt file to announce thew new version.
    """
    # TODO: For now, we simply copy the latest announcement file and use that
    #       as a template.
    try:
        with open(os.path.join(PROJECT_ROOT, 'scripts/release.tmpl'),
                  'r') as f:
            with open(os.path.join(PROJECT_ROOT,
                      'messages/{0}.txt'.format(new_tag)), 'w') as ff:
                text = f.read()
                text = text.format(version=new_tag,
                                   changes='[INSERT CHANGES HERE]')
                ff.write(text)
    except Exception as e:
        print('failed at creating new announcement file under messages/')
        raise e
    else:
        assert os.path.exists(os.path.join(PROJECT_ROOT,
            'messages/{0}.txt'.format(new_tag))), 'cannot find new announcement file'
        print('created messages/{0}.txt announcement draft'.format(new_tag))


def update_changelog(new_tag):
    assert os.path.exists(os.path.join(PROJECT_ROOT, CHANGELOG)), 'cannot find changelog file'
    path = os.path.join(PROJECT_ROOT, CHANGELOG)
    heading = '{0} - {1}\n\n'.format(new_tag,
                                     datetime.now().strftime("%Y%m%d"))

    vcs = report_vcs(PROJECT_ROOT)
    tag = get_latest_tag(vcs)

    try:
        with open(path, 'r') as original:
            try:
                with open(os.path.join(PROJECT_ROOT,
                          '_CHANGELOG.txt'), 'w') as n:
                    n.write(heading)
                    for line in get_commit_messages(vcs, tag):
                        n.write("\t- [DRAFT] {0}\n".format(line))
                    n.write('\n')
                    n.write(original.read())
            except Exception as e:
                try:
                    os.unlink(os.path.join(PROJECT_ROOT, '_CHANGELOG.txt'))
                except:
                    print('could not delete _CHANGELOG.txt temp fle.')
                finally:
                    raise e
    finally:
        shutil.move(os.path.join(PROJECT_ROOT, '_CHANGELOG.txt'),
                    os.path.join(PROJECT_ROOT, CHANGELOG),)


def increment_version_number(tag, major=False, minor=False, build=True):
    major_label, minor_label, build_label = tag.split('.')
    if major:
        new_tag = '.'.join([major_label, str(int(minor_label) + 1), '0'])
    elif minor:
        new_tag = '.'.join([str(int(minor_label) + 1), '0', '0'])
    elif build:
        new_tag = '.'.join([major_label, minor_label,
                            str(int(build_label) + 1)])
    return new_tag


def update_package_control_files(tag):
    json_data = None
    with open(os.path.join(PROJECT_ROOT, 'messages.json'), 'r') as f:
        json_data = json.load(f)
        json_data[tag] = 'messages/{0}.txt'.format(tag)

    assert json_data is not None, 'expected json data'

    with open(os.path.join(PROJECT_ROOT, 'messages.json'), 'w') as f:
        json.dump(json_data, f, indent=True)


def make_files(major=False, minor=False, build=True):
    tag = get_latest_tag(report_vcs(PROJECT_ROOT))
    if tag is None:
        return
    new_tag = increment_version_number(tag, major, minor, build)
    make_message_file(tag, new_tag)
    update_changelog(new_tag)
    update_package_control_files(new_tag)


def main():
    make_files()


if __name__ == '__main__':
    main()
