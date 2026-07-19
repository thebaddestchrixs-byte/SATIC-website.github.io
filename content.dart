/// ---------------------------------------------------------------------
/// EDIT ME
/// This file holds every piece of real, human-editable content on the
/// site: team names/roles and gallery captions. Change the strings below
/// and hot-reload — no other file needs to change.
/// ---------------------------------------------------------------------

class TeamMember {
  final String asset;
  final String name;
  final String role;
  const TeamMember(this.asset, this.name, this.role);
}

/// Seven individual member photos pulled from the club's own shots.
/// Replace the placeholder name/role for each — order matches upload order.
const List<TeamMember> kTeam = [
  TeamMember('assets/team/member_01.jpg', 'Member name', 'Role / year'),
  TeamMember('assets/team/member_02.jpg', 'Member name', 'Role / year'),
  TeamMember('assets/team/member_03.jpg', 'Member name', 'Role / year'),
  TeamMember('assets/team/member_04.jpg', 'Member name', 'Role / year'),
  TeamMember('assets/team/member_05.jpg', 'Member name', 'Role / year'),
  TeamMember('assets/team/member_06.jpg', 'Member name', 'Role / year'),
  TeamMember('assets/team/member_07.jpg', 'Member name', 'Role / year'),
];

const String kGroupPhoto = 'assets/team/group_photo.jpg';

class WorkItem {
  final String asset;
  final String tag;
  final String caption;
  const WorkItem(this.asset, this.tag, this.caption);
}

const List<WorkItem> kWork = [
  WorkItem(
    'assets/work/project_prototype.jpg',
    'Prototype',
    'A scale model wired with LEDs, sensors, and a small wheeled chassis — '
        'electronics and physical building in one project.',
  ),
  WorkItem(
    'assets/work/project_exhibition.jpg',
    'Exhibition',
    'On display at an evening exhibition — the club showing finished work '
        'to the wider student community.',
  ),
  WorkItem(
    'assets/work/project_design_sheet.jpg',
    'Design sheet',
    'Hand-drawn problem statement and mechanism sketches — the planning '
        'stage before anything gets built.',
  ),
];

const String kEmail = 'hello@satic.club';
